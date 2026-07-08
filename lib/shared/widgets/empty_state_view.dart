import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class EmptyStateView extends StatelessWidget {
  final String title;
  final String? description;
  final IconData icon;

  const EmptyStateView({
    super.key,
    required this.title,
    this.description,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingAllLg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
            AppSpacing.gapMd,
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              AppSpacing.gapSm,
              Text(
                description!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
