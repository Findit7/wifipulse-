import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';

class RecentActivityCard extends StatelessWidget {
  final List<String> activities;

  const RecentActivityCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) return const SizedBox.shrink();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Activity', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          AppSpacing.gapMd,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: AppColors.primary),
                    AppSpacing.gapMd,
                    Expanded(
                      child: Text(activities[index], style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
