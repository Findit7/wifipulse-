import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/usage_aggregates.dart';

class UsageCharts extends StatelessWidget {
  final List<DailyUsage> dailyTrends;

  const UsageCharts({super.key, required this.dailyTrends});

  @override
  Widget build(BuildContext context) {
    if (dailyTrends.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('No trend data available')),
      );
    }

    // Convert daily data to BarChart data
    final barGroups = <BarChartGroupData>[];
    double maxY = 0;

    for (int i = 0; i < dailyTrends.length; i++) {
      final trend = dailyTrends[i];
      final mb = trend.totalBytes / (1024 * 1024);
      if (mb > maxY) maxY = mb;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: mb,
              color: Theme.of(context).primaryColor,
              width: 16,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              maxY: maxY == 0 ? 100 : maxY * 1.2,
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < dailyTrends.length) {
                        final date = dailyTrends[index].date;
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            DateFormat('E').format(date),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}M',
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: barGroups,
              gridData: const FlGridData(show: true, drawVerticalLine: false),
            ),
          ),
        ),
      ),
    );
  }
}
