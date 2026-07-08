import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class DashboardBottomNavigation extends StatelessWidget {
  const DashboardBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        // Handle navigation across premium modules
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.devices_outlined), selectedIcon: Icon(Icons.devices), label: 'Devices'),
        NavigationDestination(icon: Icon(Icons.analytics_outlined), selectedIcon: Icon(Icons.analytics), label: 'Analytics'),
        NavigationDestination(icon: Icon(Icons.security_outlined), selectedIcon: Icon(Icons.security), label: 'Security'),
        NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
