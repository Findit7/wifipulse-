import 'package:flutter/material.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../../../core/theme/app_colors.dart';

class InsightFeedWidget extends StatelessWidget {
  final List<AIInsightEntity> insights;
  final bool isLoading;

  const InsightFeedWidget({
    super.key,
    required this.insights,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (insights.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text('No AI Insights available yet.',
              style: TextStyle(color: AppColors.textSecondary)),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Insights Feed',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: insights.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final insight = insights[index];
            return _buildInsightCard(insight);
          },
        ),
      ],
    );
  }

  Widget _buildInsightCard(AIInsightEntity insight) {
    IconData getIcon() {
      switch (insight.category) {
        case 'Security':
          return Icons.shield_outlined;
        case 'Usage':
          return Icons.data_usage;
        case 'Performance':
          return Icons.speed;
        default:
          return Icons.lightbulb_outline;
      }
    }

    Color getColor() {
      switch (insight.category) {
        case 'Security':
          return AppColors.error;
        case 'Usage':
          return Colors.purple;
        case 'Performance':
          return Colors.blue;
        default:
          return AppColors.primary;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: getColor().withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(getIcon(), color: getColor(), size: 24),
              const SizedBox(width: 8),
              Text(insight.category,
                  style: TextStyle(
                      color: getColor(), fontWeight: FontWeight.bold)),
              const Spacer(),
              if (insight.isLocallyGenerated)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceHighlight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Local Rules',
                      style: TextStyle(
                          fontSize: 10, color: AppColors.textSecondary)),
                )
              else
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.auto_awesome,
                          size: 12, color: AppColors.primary),
                      SizedBox(width: 4),
                      Text('AI Generated',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            ],
          ),
          const SizedBox(height: 12),
          Text(insight.insightText, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
