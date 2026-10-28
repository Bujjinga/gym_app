import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/achievement_catalog.dart';
import '../../achievements/domain/achievement_progress.dart';
import '../../profile/data/drift_profile_repository.dart';
import 'achievement_labels.dart';
import 'share_card.dart';

final _achievements =
    StreamProvider.autoDispose<List<AchievementProgress>>((ref) => ref.watch(progressRepositoryProvider).watchAchievements());

/// Level/XP bar plus every badge, locked ones showing progress.
class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final byKey = {for (final a in ref.watch(_achievements).value ?? const <AchievementProgress>[]) a.key: a};
    return Scaffold(
      appBar: AppBar(title: Text(l10n.achievementsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(PulseMetrics.space16),
        children: [
          const LevelCard(),
          const SizedBox(height: PulseMetrics.space16),
          GridView.extent(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 180,
            mainAxisSpacing: PulseMetrics.space12,
            crossAxisSpacing: PulseMetrics.space12,
            childAspectRatio: 0.85,
            children: [
              for (final (i, def) in achievementCatalog.indexed)
                () {
                  final (title, body, icon) = achievementInfo(l10n, def.key);
                  final a = byKey[def.key];
                  final unlocked = a?.isUnlocked ?? false;
                  return StaggeredEntry(
                    index: i,
                    child: GlassCard(
                      blur: false,
                      semanticLabel: '$title. $body ${unlocked ? l10n.unlocked : l10n.locked}',
                      onTap: unlocked
                          ? () => showAchievementCelebration(
                                context,
                                title: title,
                                subtitle: body,
                                icon: icon,
                                shareLabel: l10n.shareCard,
                                closeLabel: l10n.close,
                                onShare: () => showShareCard(
                                  context,
                                  ShareCardView(title: '${l10n.achievementUnlocked} $title', stats: [(body, '🏅')]),
                                ),
                              )
                          : null,
                      child: ExcludeSemantics(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          RingProgress(
                            value: a?.progress ?? 0,
                            colors: unlocked ? [c.accentStart, c.accentEnd] : [c.textMuted, c.textSecondary],
                            size: 64,
                            strokeWidth: 6,
                            child: Icon(icon, color: unlocked ? c.accentText : c.textMuted),
                          ),
                          const SizedBox(height: PulseMetrics.space8),
                          Text(title, style: text.titleSmall, textAlign: TextAlign.center, maxLines: 2),
                          Text(body, style: text.labelSmall, textAlign: TextAlign.center, maxLines: 2),
                        ]),
                      ),
                    ),
                  );
                }(),
            ],
          ),
        ],
      ),
    );
  }
}

/// Current level with an animated bar to the next one.
class LevelCard extends ConsumerWidget {
  const LevelCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final xp = ref.watch(userProfileProvider).value?.xp ?? 0;
    final level = levelForXp(xp);
    final from = xpForLevel(level), to = xpForLevel(level + 1);
    return GlassCard(
      semanticLabel: '${l10n.levelLabel(level)}, ${l10n.xpToNext(to - xp, level + 1)}',
      child: ExcludeSemantics(
        child: Row(children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, gradient: c.accentGradient),
            child: Text('$level', style: PulseTypography.number(fontSize: 24, color: c.onAccent)),
          ),
          const SizedBox(width: PulseMetrics.space16),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l10n.levelLabel(level), style: text.titleMedium),
              const SizedBox(height: PulseMetrics.space8),
              TweenAnimationBuilder<double>(
                tween: Tween(end: (xp - from) / (to - from)),
                duration: context.motion.slow,
                builder: (context, v, _) => ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(value: v, minHeight: 8, color: c.accentStart, backgroundColor: c.glassBorder),
                ),
              ),
              const SizedBox(height: PulseMetrics.space4),
              Text('$xp ${l10n.xp} · ${l10n.xpToNext(to - xp, level + 1)}', style: text.labelSmall),
            ]),
          ),
        ]),
      ),
    );
  }
}
