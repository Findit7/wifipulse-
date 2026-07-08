import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

enum NetworkStatus { excellent, good, fair, poor, offline }

class NetworkStatusBadge extends StatelessWidget {
  final NetworkStatus status;

  const NetworkStatusBadge({super.key, required this.status});

  Color _getStatusColor() {
    switch (status) {
      case NetworkStatus.excellent:
        return AppColors.networkExcellent;
      case NetworkStatus.good:
        return AppColors.networkGood;
      case NetworkStatus.fair:
        return AppColors.networkFair;
      case NetworkStatus.poor:
        return AppColors.networkPoor;
      case NetworkStatus.offline:
        return AppColors.networkOffline;
    }
  }

  String _getStatusText() {
    switch (status) {
      case NetworkStatus.excellent: return 'Excellent';
      case NetworkStatus.good: return 'Good';
      case NetworkStatus.fair: return 'Fair';
      case NetworkStatus.poor: return 'Poor';
      case NetworkStatus.offline: return 'Offline';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: AppRadius.roundedSm,
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi, size: 14, color: color),
          AppSpacing.gapXs,
          Text(
            _getStatusText(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
