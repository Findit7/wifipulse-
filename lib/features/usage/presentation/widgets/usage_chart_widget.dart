import 'package:flutter/material.dart';
import '../../domain/entities/usage_summary_entity.dart';
import '../../../../core/theme/app_colors.dart';

class UsageChartWidget extends StatelessWidget {
  final UsageSummaryEntity summary;

  const UsageChartWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final total = summary.totalDownloadBytes + summary.totalUploadBytes;
    final downloadRatio = total == 0 ? 0.5 : summary.totalDownloadBytes / total;
    
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
          Text('Usage Overview', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStat(context, 'Total', _formatBytes(total), AppColors.primary),
              _buildStat(context, 'Download', _formatBytes(summary.totalDownloadBytes), Colors.blue),
              _buildStat(context, 'Upload', _formatBytes(summary.totalUploadBytes), Colors.purple),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 12,
              color: AppColors.surfaceHighlight,
              child: Row(
                children: [
                  Expanded(
                    flex: (downloadRatio * 100).toInt(),
                    child: Container(color: Colors.blue),
                  ),
                  Expanded(
                    flex: ((1 - downloadRatio) * 100).toInt(),
                    child: Container(color: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Projected Monthly: ${_formatBytes(summary.projectedMonthlyBytes)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          )
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
            const SizedBox(width: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
          ],
        ),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _formatBytes(double bytes) {
    if (bytes == 0) return '0 B';
    final mb = bytes / (1024 * 1024);
    if (mb > 1024) return '${(mb / 1024).toStringAsFixed(1)} GB';
    return '${mb.toStringAsFixed(1)} MB';
  }
}
