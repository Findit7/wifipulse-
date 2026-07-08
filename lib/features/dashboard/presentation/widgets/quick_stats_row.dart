import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';

class QuickStatsRow extends StatelessWidget {
  final DashboardStatistics stats;

  const QuickStatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Devices',
            value: '${stats.connectedDevices}',
            icon: Icons.devices,
            color: AppColors.info,
          ),
        ),
        AppSpacing.gapMd,
        Expanded(
          child: _StatCard(
            title: 'Download',
            value: '${stats.downloadSpeedMbps.toStringAsFixed(1)} Mbps',
            icon: Icons.download,
            color: AppColors.success,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.paddingAllMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              AppSpacing.gapSm,
              Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6))),
            ],
          ),
          AppSpacing.gapSm,
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
