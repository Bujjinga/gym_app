import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/utils/ids.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../nutrition/data/drift_nutrition_repository.dart';
import '../../nutrition/domain/water_log.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/progress_providers.dart';

/// Water intake: an animated filling glass and quick-add buttons.
class WaterScreen extends ConsumerWidget {
  const WaterScreen({super.key});

  Future<void> _add(BuildContext context, WidgetRef ref, int ml, int before, int goal) async {
    await ref.read(nutritionRepositoryProvider).addWater(WaterLog(id: newId(), loggedAt: DateTime.now(), amountMl: ml));
    if (before < goal && before + ml >= goal) {
      Haptics.success();
      if (context.mounted) PulseToast.show(context, AppLocalizations.of(context).waterGoalReached, kind: ToastKind.success);
    } else {
      Haptics.tap();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final logs = ref.watch(waterTodayProvider).value ?? const [];
    final goal = ref.watch(userProfileProvider).value?.waterGoalMl ?? 2500;
    final total = logs.fold(0, (a, l) => a + l.amountMl);

    Future<void> custom() async {
      final controller = TextEditingController(text: '330');
      final ml = await showDialog<int>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.custom),
          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(suffixText: 'ml'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
            FilledButton(onPressed: () => Navigator.pop(ctx, int.tryParse(controller.text)), child: Text(l10n.save)),
          ],
        ),
      );
      controller.dispose();
      if (ml != null && ml > 0 && ml <= 3000 && context.mounted) await _add(context, ref, ml, total, goal);
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.water)),
      body: ListView(
        padding: const EdgeInsets.all(PulseMetrics.space16),
        children: [
          Center(
            child: Semantics(
              label: l10n.waterProgress(total, goal),
              child: WaterGlass(progress: total / goal, size: 220),
            ),
          ),
          const SizedBox(height: PulseMetrics.space16),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                RollingNumber(value: total, style: Theme.of(context).textTheme.displaySmall),
                Text(' / $goal ml', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(height: PulseMetrics.space24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: PulseMetrics.space12,
            runSpacing: PulseMetrics.space12,
            children: [
              for (final ml in const [250, 500, 750])
                PrimaryButton(label: '+$ml ml', onPressed: () => _add(context, ref, ml, total, goal)),
              SecondaryButton(label: l10n.custom, icon: Icons.edit_rounded, onPressed: custom),
            ],
          ),
          const SizedBox(height: PulseMetrics.space16),
          for (final log in logs.reversed)
            ListTile(
              leading: const Icon(Icons.water_drop_rounded),
              title: Text('${log.amountMl} ml'),
              subtitle: Text(DateFormat.jm().format(log.loggedAt.toLocal())),
              trailing: IconButton(
                tooltip: l10n.delete,
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () => ref.read(nutritionRepositoryProvider).deleteWater(log.id),
              ),
            ),
        ],
      ),
    );
  }
}

/// A glass that fills to [progress] with an animated wave surface.
class WaterGlass extends StatefulWidget {
  const WaterGlass({super.key, required this.progress, this.size = 160});

  final double progress;
  final double size;

  @override
  State<WaterGlass> createState() => _WaterGlassState();
}

class _WaterGlassState extends State<WaterGlass> with SingleTickerProviderStateMixin {
  late final _wave = AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.reduceMotion ? _wave.stop() : _wave.repeat();
  }

  @override
  void dispose() {
    _wave.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return TweenAnimationBuilder<double>(
      tween: Tween(end: widget.progress.clamp(0.0, 1.0)),
      duration: context.motion.slow,
      curve: MotionPreset.smooth.curve,
      builder: (context, level, _) => RepaintBoundary(
        child: CustomPaint(
          size: Size(widget.size * 0.7, widget.size),
          painter: _GlassPainter(level: level, phase: _wave, water: c.accentEnd, edge: c.glassBorder),
        ),
      ),
    );
  }
}

class _GlassPainter extends CustomPainter {
  _GlassPainter({required this.level, required this.phase, required this.water, required this.edge})
      : super(repaint: phase);

  final double level;
  final Animation<double> phase;
  final Color water;
  final Color edge;

  @override
  void paint(Canvas canvas, Size size) {
    // Slightly tapered glass.
    final glass = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.88, size.height)
      ..lineTo(size.width * 0.12, size.height)
      ..close();
    canvas.save();
    canvas.clipPath(glass);
    final surface = size.height * (1 - level);
    final amp = level <= 0 || level >= 1 ? 0.0 : 6.0;
    final wave = Path()..moveTo(0, size.height);
    for (var x = 0.0; x <= size.width; x += 2) {
      wave.lineTo(x, surface + math.sin(x / size.width * 2 * math.pi + phase.value * 2 * math.pi) * amp);
    }
    wave
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(
      wave,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [water.withValues(alpha: 0.6), water],
        ).createShader(Offset.zero & size),
    );
    canvas.restore();
    canvas.drawPath(
      glass,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = edge,
    );
  }

  @override
  bool shouldRepaint(_GlassPainter old) => old.level != level || old.water != water;
}
