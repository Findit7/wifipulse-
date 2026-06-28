import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class NetworkPulseCard extends StatelessWidget {
  final DashboardSummaryEntity summary;

  const NetworkPulseCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Network Pulse',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: summary.isOnline
                      ? AppColors.success.withValues(alpha: 0.1)
                      : AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(summary.isOnline ? Icons.check_circle : Icons.error,
                        color: summary.isOnline
                            ? AppColors.success
                            : AppColors.error,
                        size: 16),
                    const SizedBox(width: 4),
                    Text(summary.isOnline ? 'Healthy' : 'Offline',
                        style: TextStyle(
                            color: summary.isOnline
                                ? AppColors.success
                                : AppColors.error,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPulseMetric(
                  context, 'Ping', '${summary.pingMs.toInt()} ms', Icons.speed),
              _buildPulseMetric(context, 'Download',
                  '${summary.latestDownloadMbps.toInt()} Mbps', Icons.download),
              _buildPulseMetric(context, 'Upload',
                  '${summary.latestUploadMbps.toInt()} Mbps', Icons.upload),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPulseMetric(
      BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryLight, size: 24),
        ),
        const SizedBox(height: 12),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 4),
        Text(label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textSecondary)),
      ],
    );
  }
}
