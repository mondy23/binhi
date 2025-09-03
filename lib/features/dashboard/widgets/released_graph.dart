import 'package:binhi/core/constants.dart';
import 'package:binhi/models/points_entry_model.dart';
import 'package:binhi/providers/provider.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReleasedGraph extends ConsumerWidget {
  const ReleasedGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releasedAsync = ref.watch(releaseChartProvider);

    return CustomContainer(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: releasedAsync.when(
          data: (points) {
            if (points.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Released',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              '${rod.toY.toInt()}', // the text to display
                              TextStyle(
                                color: Colors.white, // <-- tooltip text color
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      barGroups: _chartGroups(points: points, color: primary),
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final labels = ['M', 'T', 'W', 'T', 'F', 'S'];
                              return Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  labels[value.toInt() % labels.length],
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) =>
              Center(child: Text('Error loading data: $err')),
        ),
      ),
    );
  }
}

List<BarChartGroupData> _chartGroups({
  required List<PointsEntry> points,
  required Color color,
}) {
  return points.asMap().entries.map((entry) {
    final index = entry.key;
    final point = entry.value;
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: point.points.toDouble(),
          width: 12,
          color: color.withOpacity(point.points > 4 ? 1 : 0.4),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
        ),
      ],
    );
  }).toList();
}
