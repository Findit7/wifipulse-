import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/security_score_indicator.dart';

class NetworkHealthCard extends StatelessWidget {
  final DashboardStatistics stats;

  const NetworkHealthCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Network Health', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const Icon(Icons.health_and_safety, color: AppColors.success),
            ],
          ),
          AppSpacing.gapLg,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SecurityScoreIndicator(score: stats.healthScore),
                  AppSpacing.gapSm,
                  Text('Overall Health', style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              Column(
                children: [
                  SecurityScoreIndicator(score: stats.securityScore),
                  AppSpacing.gapSm,
                  Text('Security Score', style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          ),
          AppSpacing.gapLg,
          Container(
            padding: AppSpacing.paddingAllSm,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
                AppSpacing.gapSm,
                Expanded(
                  child: Text(
                    'AI Analysis: ${stats.aiStatus}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
