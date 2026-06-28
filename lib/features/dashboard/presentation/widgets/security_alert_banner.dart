import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class SecurityAlertBanner extends StatelessWidget {
  final DashboardSummaryEntity summary;

  const SecurityAlertBanner({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    if (summary.activeAlerts.isEmpty) {
      return const SizedBox.shrink();
    }

    final alert = summary.activeAlerts.first;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.error),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Security Alert',
                    style: TextStyle(
                        color: AppColors.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                Text(alert.message,
                    style: const TextStyle(
                        color: AppColors.textPrimary, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
