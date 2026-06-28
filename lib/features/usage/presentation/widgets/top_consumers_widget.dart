import 'package:flutter/material.dart';
import '../../domain/entities/usage_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class TopConsumersWidget extends StatelessWidget {
  final List<DeviceUsageEntity> topConsumers;

  const TopConsumersWidget({super.key, required this.topConsumers});

  @override
  Widget build(BuildContext context) {
    if (topConsumers.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text('No device-level usage data available.\nRequires router API support.', 
                      textAlign: TextAlign.center, 
                      style: TextStyle(color: AppColors.textSecondary)),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Devices', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topConsumers.length,
            itemBuilder: (context, index) {
              final consumer = topConsumers[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.devices, color: AppColors.primaryLight),
                title: Text(consumer.device.customName ?? consumer.device.hostname ?? 'Unknown Device'),
                subtitle: Text(consumer.device.deviceType),
                trailing: Text(_formatBytes(consumer.totalBytes), 
                               style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatBytes(double bytes) {
    if (bytes == 0) return '0 B';
    final mb = bytes / (1024 * 1024);
    if (mb > 1024) return '${(mb / 1024).toStringAsFixed(1)} GB';
    return '${mb.toStringAsFixed(1)} MB';
  }
}
