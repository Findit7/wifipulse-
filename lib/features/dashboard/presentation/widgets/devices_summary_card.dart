import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class DevicesSummaryCard extends StatelessWidget {
  final DashboardSummaryEntity summary;

  const DevicesSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return _buildBaseCard(
      context: context,
      title: 'Devices',
      icon: Icons.devices,
      value: '${summary.totalDevices}',
      subtitle: '${summary.newDevices} new recently',
      onTap: () {
        // Navigate to Devices
      },
    );
  }

  Widget _buildBaseCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String value,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
                Icon(icon, color: AppColors.primaryLight, size: 20),
                const SizedBox(width: 8),
                Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
            const Spacer(),
            Text(value, style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
