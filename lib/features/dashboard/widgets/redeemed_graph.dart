
import 'package:binhi/core/constants.dart';
import 'package:binhi/models/bar_graph_model.dart';
import 'package:binhi/models/graph_model.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RedeemedGraph extends StatelessWidget {
  const RedeemedGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final redeemedData = BarGraphData().data.firstWhere(
      (item) => item.label == 'Redeemed',
    );

    return CustomContainer(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              redeemedData.label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _chartGroups(
                    points: redeemedData.graph,
                    color: blue
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

class BarGraphData {
  final data = [
    BarGraphModel(
      label: 'Released',
      color: Color(0xfffeb95a),
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),
    BarGraphModel(
      label: 'Redeemed',
      color: Color(0xFFF2C8ED),
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 9),
        GraphModel(x: 3, y: 6),
        GraphModel(x: 4, y: 6),
        GraphModel(x: 5, y: 7),
      ],
    ),

  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}


