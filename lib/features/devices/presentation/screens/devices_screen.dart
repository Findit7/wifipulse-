import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_navigation.dart';
import '../../domain/entities/device_entity.dart';
import '../providers/device_provider.dart';

class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceState = ref.watch(deviceControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connected Devices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(deviceControllerProvider.notifier).scanNetwork();
            },
          ),
        ],
      ),
      bottomNavigationBar: const DashboardBottomNavigation(),
      body: deviceState.when(
        idle: () => const Center(child: Text('Pull to refresh or tap scan to discover devices.')),
        scanning: (savedDevices) => _buildContent(context, savedDevices, isScanning: true),
        loaded: (devices) => _buildContent(context, devices, isScanning: false),
        error: (message) => Center(child: Text('Error: $message', style: const TextStyle(color: AppColors.danger))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<DeviceEntity> devices, {required bool isScanning}) {
    return Column(
      children: [
        if (isScanning) const LinearProgressIndicator(),
        if (!isScanning && devices.isEmpty)
           const Expanded(child: Center(child: Text('No devices found.'))),
        if (devices.isNotEmpty)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppCard(
                    onTap: () {
                      context.push('/devices/${device.id}');
                    },
                    child: Row(
                      children: [
                        _buildDeviceIcon(device.deviceType),
                        AppSpacing.gapMd,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                device.customName ?? device.hostname ?? device.macAddress,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(device.ipAddress ?? 'Unknown IP', style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: 2),
                              Text(device.vendor ?? 'Unknown Vendor', style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: device.isOnline ? AppColors.success.withValues(alpha: 0.1) : AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: device.isOnline ? AppColors.success : AppColors.outline,
                                ),
                              ),
                              child: Text(
                                device.isOnline ? 'Online' : 'Offline',
                                style: TextStyle(
                                  color: device.isOnline ? AppColors.success : AppColors.outline,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (device.isTrusted)
                               const Icon(Icons.verified_user, color: AppColors.success, size: 16)
                            else
                               const Icon(Icons.warning_amber_rounded, color: AppColors.warning, size: 16),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildDeviceIcon(String type) {
    IconData iconData;
    switch (type.toLowerCase()) {
      case 'phone':
        iconData = Icons.smartphone;
        break;
      case 'laptop':
        iconData = Icons.laptop;
        break;
      case 'tv':
        iconData = Icons.tv;
        break;
      case 'router':
        iconData = Icons.router;
        break;
      default:
        iconData = Icons.devices;
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: AppColors.primary),
    );
  }
}
