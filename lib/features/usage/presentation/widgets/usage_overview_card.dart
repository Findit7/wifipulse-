import 'package:flutter/material.dart';
import '../../domain/entities/usage_aggregates.dart';

class UsageOverviewCard extends StatelessWidget {
  final UsageSummary? summary;

  const UsageOverviewCard({super.key, this.summary});

  @override
  Widget build(BuildContext context) {
    if (summary == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No usage data available'),
        ),
      );
    }

    final totalMB = summary!.totalBytes / (1024 * 1024);
    final upMB = summary!.totalUploadBytes / (1024 * 1024);
    final downMB = summary!.totalDownloadBytes / (1024 * 1024);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total Data Usage', style: TextStyle(color: Colors.grey)),
                    Text('${totalMB.toStringAsFixed(2)} MB', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.data_usage, size: 40, color: Theme.of(context).primaryColor),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(context, Icons.download, 'Download', '${downMB.toStringAsFixed(2)} MB', Colors.green),
                _buildStatItem(context, Icons.upload, 'Upload', '${upMB.toStringAsFixed(2)} MB', Colors.blue),
                _buildStatItem(context, Icons.devices, 'Devices', '${summary!.activeDevices}', Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
