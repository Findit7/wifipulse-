import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_radius.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;

  const GlassCard({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.roundedLg,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: opacity),
            borderRadius: AppRadius.roundedLg,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
