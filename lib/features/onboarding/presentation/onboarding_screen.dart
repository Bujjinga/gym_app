import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/platform/permissions_service.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../application/onboarding_controller.dart';
import 'steps/body_step.dart';
import 'steps/choice_steps.dart';
import 'steps/equipment_step.dart';
import 'steps/permissions_step.dart';
import 'steps/schedule_step.dart';
import 'steps/welcome_step.dart';

/// Paged first-run setup: welcome → goal → experience → equipment
/// → schedule → body stats → (mobile) permissions.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pages = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    setState(() => _index = index);
    if (context.reduceMotion) {
      _pages.jumpToPage(index);
    } else {
      _pages.animateToPage(index, duration: const Duration(milliseconds: 420), curve: MotionPreset.smooth.curve);
    }
  }

  Future<void> _finish() async {
    Haptics.success();
    await ref.read(onboardingControllerProvider.notifier).finish();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final draft = ref.watch(onboardingControllerProvider);
    final hasPermissions = ref.watch(permissionsServiceProvider).applicable.isNotEmpty;

    Widget body;
    if (draft.value == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      void next() => _goTo(_index + 1);
      final steps = <Widget>[
        WelcomeStep(onNext: next),
        GoalStep(onNext: next),
        ExperienceStep(onNext: next),
        EquipmentStep(onNext: next),
        ScheduleStep(onNext: next),
        BodyStep(onNext: hasPermissions ? next : _finish, isLast: !hasPermissions),
        if (hasPermissions) PermissionsStep(onNext: _finish),
      ];
      final setupSteps = steps.length - 1; // the welcome page isn't numbered
      body = Column(
        children: [
          AnimatedSwitcher(
            duration: context.motion.medium,
            child: _index == 0
                ? const SizedBox(height: 56)
                : Padding(
                    padding: const EdgeInsets.fromLTRB(PulseMetrics.space8, PulseMetrics.space8, PulseMetrics.space24, 0),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: l10n.back,
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () => _goTo(_index - 1),
                        ),
                        Expanded(
                          child: StepProgressBar(
                            step: _index - 1,
                            count: setupSteps,
                            semanticLabel: l10n.stepOf(_index, setupSteps),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Expanded(
            child: PageView(
              controller: _pages,
              physics: const NeverScrollableScrollPhysics(),
              children: steps,
            ),
          ),
        ],
      );
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MeshGradientBackground(child: SafeArea(child: body)),
    );
  }
}
