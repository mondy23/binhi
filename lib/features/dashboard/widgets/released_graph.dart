import 'package:binhi/core/constants.dart';
import 'package:binhi/features/dashboard/widgets/redeemed_graph.dart';
import 'package:binhi/models/graph_model.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReleasedGraph extends StatelessWidget {
  const ReleasedGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final releasedData = BarGraphData().data.firstWhere(
      (item) => item.label == 'Released',
    );

    return CustomContainer(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              releasedData.label,
              // style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _chartGroups(
                    points: releasedData.graph,
                    color: primary,
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final labels = BarGraphData().label;
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              labels[value.toInt()],
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
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BarChartGroupData> _chartGroups({
  required List<GraphModel> points,
  required Color color,
}) {
  return points
      .map(
        (point) => BarChartGroupData(
          x: point.x.toInt(),
          barRods: [
            BarChartRodData(
              toY: point.y,
              width: 12,
              color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
          ],
        ),
      )
      .toList();
}
