import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/network_pulse_card.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/devices_summary_card.dart';
import '../widgets/security_summary_card.dart';
import '../widgets/usage_summary_card.dart';
import '../widgets/latest_insight_card.dart';
import '../widgets/security_alert_banner.dart';
import '../../../../core/theme/app_colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: dashboardState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Failed to load dashboard', style: TextStyle(color: AppColors.error)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.read(dashboardControllerProvider.notifier).refresh(),
                  child: const Text('Retry'),
                )
              ],
            ),
          ),
          data: (summary) {
            return RefreshIndicator(
              onRefresh: () => ref.read(dashboardControllerProvider.notifier).refresh(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary.activeNetwork?.ssid ?? 'No Network Selected',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    SecurityAlertBanner(summary: summary),
                    
                    NetworkPulseCard(summary: summary),
                    const SizedBox(height: 24),
                    
                    const QuickActionsRow(),
                    const SizedBox(height: 24),

                    Text('Overview', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: [
                        DevicesSummaryCard(summary: summary),
                        SecuritySummaryCard(summary: summary),
                      ],
                    ),
                    const SizedBox(height: 16),
                    UsageSummaryCard(summary: summary),
                    
                    const SizedBox(height: 24),
                    if (summary.latestInsight != null) ...[
                      Text('Insights', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      LatestInsightCard(summary: summary),
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
