import 'package:flutter/material.dart';

import '../core/design_system/design_system.dart';

/// Shown for the moment it takes to load the profile and decide between
/// onboarding and Home.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MeshGradientBackground(
        child: Center(
          child: ShaderMask(
            shaderCallback: (r) => c.accentGradient.createShader(r),
            child: Text('PULSE', style: PulseTypography.number(fontSize: 44, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
