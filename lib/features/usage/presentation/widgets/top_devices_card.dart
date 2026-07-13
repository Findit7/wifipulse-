import 'package:flutter/material.dart';
import '../../domain/entities/usage_aggregates.dart';

class TopDevicesCard extends StatelessWidget {
  final List<TopDevice> devices;

  const TopDevicesCard({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No device data available'),
        ),
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: devices.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final device = devices[index];
          final mb = device.totalBytes / (1024 * 1024);
          
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Text('${index + 1}'),
            ),
            title: Text(device.deviceName),
            subtitle: Text(device.deviceId, style: const TextStyle(fontSize: 10)),
            trailing: Text('${mb.toStringAsFixed(2)} MB', style: const TextStyle(fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}
