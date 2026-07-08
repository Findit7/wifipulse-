import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/network_status_badge.dart';

class NetworkHeaderCard extends StatelessWidget {
  final NetworkSummary network;

  const NetworkHeaderCard({super.key, required this.network});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    network.isOnline ? Icons.wifi : Icons.wifi_off,
                    color: network.isOnline ? AppColors.networkExcellent : AppColors.networkOffline,
                    size: 28,
                  ),
                  AppSpacing.gapSm,
                  Text(
                    network.ssid ?? 'Unknown Network',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              NetworkStatusBadge(status: network.isOnline ? NetworkStatus.excellent : NetworkStatus.offline),
            ],
          ),
          AppSpacing.gapMd,
          Row(
            children: [
              _buildInfoItem(context, Icons.router, 'Gateway', network.gatewayIp ?? '--'),
              AppSpacing.gapLg,
              _buildInfoItem(context, Icons.computer, 'Local IP', network.localIp ?? '--'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
        AppSpacing.gapXs,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5))),
            Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
