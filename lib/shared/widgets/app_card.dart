import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/app_shadows.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.paddingComponent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        boxShadow: isDark ? AppShadows.darkMd : AppShadows.lightMd,
        borderRadius: AppRadius.roundedLg,
      ),
      child: Material(
        color: Theme.of(context).cardTheme.color,
        borderRadius: AppRadius.roundedLg,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
