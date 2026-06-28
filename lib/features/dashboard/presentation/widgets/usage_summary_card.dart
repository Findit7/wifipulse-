import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class UsageSummaryCard extends StatelessWidget {
  final DashboardSummaryEntity summary;

  const UsageSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to Usage
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.surfaceHighlight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.data_usage,
                    color: AppColors.primaryLight, size: 20),
                const SizedBox(width: 8),
                Text('Usage (Today)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 16),
            Text(
                '${(summary.todaysUsageBytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Total aggregated',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
