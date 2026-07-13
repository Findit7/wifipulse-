import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/usage_provider.dart';
import '../widgets/usage_overview_card.dart';
import '../widgets/usage_charts.dart';
import '../widgets/top_devices_card.dart';
import '../widgets/forecast_card.dart';
import '../widgets/export_button.dart';
import '../../dashboard/presentation/widgets/dashboard_bottom_navigation.dart';

class UsageScreen extends ConsumerWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Start data collection background service when screen builds (if not already running)
    ref.watch(usageCollectionControllerProvider);

    final summaryAsync = ref.watch(usageSummaryProvider);
    final topDevicesAsync = ref.watch(topDevicesProvider);
    final dailyTrendsAsync = ref.watch(dailyTrendsProvider);
    final forecastAsync = ref.watch(usageForecastProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Usage'),
        actions: const [
          ExportButton(),
        ],
      ),
      bottomNavigationBar: const DashboardBottomNavigation(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(usageRefreshTickerProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    summaryAsync.when(
                      data: (summary) => UsageOverviewCard(summary: summary),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error loading summary: $err'),
                    ),
                    const SizedBox(height: 24),
                    const Text('Usage Trends', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    dailyTrendsAsync.when(
                      data: (trends) => UsageCharts(dailyTrends: trends),
                      loading: () => const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
                      error: (err, stack) => Text('Error loading trends: $err'),
                    ),
                    const SizedBox(height: 24),
                    const Text('Forecast', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    forecastAsync.when(
                      data: (forecast) => ForecastCard(forecast: forecast),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error loading forecast: $err'),
                    ),
                    const SizedBox(height: 24),
                    const Text('Top Consumers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    topDevicesAsync.when(
                      data: (devices) => TopDevicesCard(devices: devices),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error loading devices: $err'),
                    ),
                    const SizedBox(height: 48), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
