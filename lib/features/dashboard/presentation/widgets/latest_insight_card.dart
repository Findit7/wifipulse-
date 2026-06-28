import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class LatestInsightCard extends StatelessWidget {
  final DashboardSummaryEntity summary;

  const LatestInsightCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final insight = summary.latestInsight;
    if (insight == null) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 0,
      color: AppColors.primary.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.lightbulb, color: AppColors.primaryLight),
        ),
        title: Text(insight.category,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(insight.insightText,
            style: const TextStyle(color: AppColors.textSecondary)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: AppColors.primaryLight),
        onTap: () {
          // Open AI Insights screen
        },
      ),
    );
  }
}
