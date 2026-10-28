import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';

/// Previews [card] in a dialog and shares it as a PNG rendered with
/// `RepaintBoundary.toImage`.
Future<void> showShareCard(BuildContext context, Widget card) {
  final key = GlobalKey();
  final l10n = AppLocalizations.of(context);
  return showDialog<void>(
    context: context,
    builder: (ctx) => Dialog(
      backgroundColor: Colors.transparent,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        RepaintBoundary(key: key, child: card),
        const SizedBox(height: PulseMetrics.space16),
        PrimaryButton(
          label: l10n.share,
          icon: Icons.ios_share_rounded,
          onPressed: () async {
            final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
            final image = await boundary.toImage(pixelRatio: 3);
            final png = await image.toByteData(format: ui.ImageByteFormat.png);
            if (png == null) return;
            await SharePlus.instance.share(ShareParams(
              files: [XFile.fromData(png.buffer.asUint8List(), mimeType: 'image/png', name: 'pulse.png')],
            ));
          },
        ),
      ]),
    ),
  );
}

/// Branded card: gradient, big headline stats and the PULSE wordmark.
class ShareCardView extends StatelessWidget {
  const ShareCardView({super.key, required this.title, required this.stats});

  final String title;
  final List<(String label, String value)> stats;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return Container(
      width: 320,
      padding: const EdgeInsets.all(PulseMetrics.space24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [c.surfaceRaised, c.background, c.accentEnd.withValues(alpha: 0.35)],
        ),
        border: Border.all(color: c.glassBorder),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        ShaderMask(
          shaderCallback: (r) => c.accentGradient.createShader(r),
          child: Text('PULSE', style: PulseTypography.number(fontSize: 20, color: Colors.white)),
        ),
        const SizedBox(height: PulseMetrics.space12),
        Text(title, style: text.headlineSmall),
        const SizedBox(height: PulseMetrics.space16),
        for (final (label, value) in stats)
          Padding(
            padding: const EdgeInsets.only(bottom: PulseMetrics.space8),
            child: Row(children: [
              Expanded(child: Text(label, style: text.bodyMedium)),
              Text(value, style: PulseTypography.number(fontSize: 22, color: c.textPrimary)),
            ]),
          ),
      ]),
    );
  }
}
