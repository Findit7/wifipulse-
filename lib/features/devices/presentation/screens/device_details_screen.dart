import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../domain/usecases/get_device_details_usecase.dart';
import '../providers/device_provider.dart';

class DeviceDetailsScreen extends ConsumerWidget {
  final String deviceId;

  const DeviceDetailsScreen({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceFuture = ref.watch(getDeviceDetailsUseCaseProvider).execute(deviceId);

    return Scaffold(
      appBar: AppBar(title: const Text('Device Details')),
      body: FutureBuilder(
        future: deviceFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
             return Center(child: Text('Error: ${snapshot.error}'));
          }

          final result = snapshot.data;
          if (result == null) return const Center(child: Text('No data'));

          return result.fold(
            (failure) => Center(child: Text('Error: ${failure.message}', style: const TextStyle(color: AppColors.danger))),
            (device) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.devices, size: 48, color: AppColors.primary),
                            AppSpacing.gapLg,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    device.customName ?? device.hostname ?? 'Unknown Device',
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(device.vendor ?? 'Unknown Vendor', style: Theme.of(context).textTheme.titleMedium),
                                ],
                              ),
                            )
                          ],
                        ),
                        AppSpacing.gapLg,
                        const Divider(),
                        AppSpacing.gapMd,
                        _buildInfoRow('IP Address', device.ipAddress ?? 'Unknown'),
                        _buildInfoRow('MAC Address', device.macAddress),
                        _buildInfoRow('Device Type', device.deviceType),
                        _buildInfoRow('First Seen', device.firstSeen.toString().split('.')[0]),
                        _buildInfoRow('Last Active', device.lastSeen.toString().split('.')[0]),
                        _buildInfoRow('Risk Score', device.riskScore.toString()),
                      ],
                    ),
                  ),
                  AppSpacing.gapLg,
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Security Status', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                         AppSpacing.gapMd,
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              const Text('Trusted Device'),
                              Switch(
                                value: device.isTrusted,
                                activeThumbColor: AppColors.success,
                                onChanged: (val) {
                                  ref.read(deviceControllerProvider.notifier).updateTrustStatus(device.id, val);
                                  // In a real app we'd refresh the current screen's future too, or just depend on the state provider instead of future provider for single device.
                                },
                              ),
                           ],
                         ),
                         const SizedBox(height: 8),
                         const Text(
                           'Marking a device as trusted will prevent security alerts when it joins the network.',
                           style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                         )
                      ]
                    )
                  )
                ],
              );
            }
          );
        },
      )
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(color: AppColors.textSecondary)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
