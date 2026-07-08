import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/network_header_card.dart';
import '../widgets/quick_stats_row.dart';
import '../widgets/network_health_card.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_activity_card.dart';
import '../widgets/dashboard_bottom_navigation.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/loading_view.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);
    final authState = ref.watch(authControllerProvider);
    final isGuest = authState.status == AuthStateStatus.guest;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.wifi_tethering, color: AppColors.primary),
            AppSpacing.gapSm,
            Text('WiFiPulse', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Open user profile or auth modal
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
        ],
      ),
      body: dashboardState.when(
        data: (status) => RefreshIndicator(
          onRefresh: () => ref.read(dashboardControllerProvider.notifier).refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppSpacing.paddingAllLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isGuest)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.warning.withValues(alpha: 0.5)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.warning),
                        AppSpacing.gapSm,
                        Expanded(
                          child: Text('You are in Guest Mode. Some features may be limited.'),
                        ),
                      ],
                    ),
                  ),
                NetworkHeaderCard(network: status.network),
                AppSpacing.gapLg,
                QuickStatsRow(stats: status.stats),
                AppSpacing.gapLg,
                NetworkHealthCard(stats: status.stats),
                AppSpacing.gapLg,
                const QuickActions(),
                AppSpacing.gapLg,
                RecentActivityCard(activities: status.recentActivity),
                const SizedBox(height: 100), // padding for bottom nav
              ],
            ),
          ),
        ),
        loading: () => const LoadingView(message: 'Loading Dashboard...'),
        error: (error, stack) => ErrorView(
          message: 'Failed to load dashboard: $error',
          onRetry: () => ref.read(dashboardControllerProvider.notifier).refresh(),
        ),
      ),
      bottomNavigationBar: const DashboardBottomNavigation(),
    );
  }
}
