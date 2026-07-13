import 'package:flutter/material.dart';
import '../../domain/entities/usage_aggregates.dart';

class ForecastCard extends StatelessWidget {
  final UsageForecast? forecast;

  const ForecastCard({super.key, this.forecast});

  @override
  Widget build(BuildContext context) {
    if (forecast == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Forecast data not available'),
        ),
      );
    }

    final todayMB = forecast!.predictedTodayBytes / (1024 * 1024);
    final tomorrowMB = forecast!.predictedTomorrowBytes / (1024 * 1024);
    final monthMB = forecast!.predictedMonthlyBytes / (1024 * 1024);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.analytics, color: Colors.purple),
                const SizedBox(width: 8),
                const Text('AI Prediction', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildForecastItem('Today', '${todayMB.toStringAsFixed(1)} MB'),
                _buildForecastItem('Tomorrow', '${tomorrowMB.toStringAsFixed(1)} MB'),
                _buildForecastItem('This Month', '${monthMB.toStringAsFixed(1)} MB'),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'Expected Peak Hours: ${forecast!.predictedPeakHours.map((h) => '$h:00').join(', ')}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
