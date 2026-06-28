import 'package:flutter/material.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../../../core/theme/app_colors.dart';

class DashboardLatestInsightWidget extends StatelessWidget {
  final AIInsightEntity? insight;
  final bool isLoading;

  const DashboardLatestInsightWidget({
    super.key,
    required this.insight,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (insight == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.surface, AppColors.primary.withValues(alpha: 0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome,
                  color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                  insight!.isLocallyGenerated
                      ? 'Latest Recommendation'
                      : 'AI Insight',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 12),
          Text(insight!.insightText,
              style: const TextStyle(fontSize: 14, height: 1.4)),
        ],
      ),
    );
  }
}
