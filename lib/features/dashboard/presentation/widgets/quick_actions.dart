import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(context, Icons.search, 'Scan', () {}),
        _buildAction(context, Icons.speed, 'Speed', () {}),
        _buildAction(context, Icons.data_usage, 'Usage', () {}),
        _buildAction(context, Icons.security, 'Security', () {}),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: Icon(icon, color: AppColors.primary),
            ),
            AppSpacing.gapSm,
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
