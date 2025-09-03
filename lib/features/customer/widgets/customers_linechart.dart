import 'package:binhi/core/constants.dart';
import 'package:binhi/providers/provider.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerLineChartCard extends ConsumerWidget {
  const CustomerLineChartCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerAsync = ref.watch(customerChartProvider);

    return CustomContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customers',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: customerAsync.when(
              data: (points) {
                if (points.isEmpty) {
                  return const Center(child: Text('No data available'));
                }

                // Group points by month
                final monthlyPoints = List<double>.filled(12, 0);
                for (var point in points) {
                  monthlyPoints[point.date.month - 1] += point.points
                      .toDouble();
                }

                final spots = List.generate(
                  12,
                  (i) => FlSpot(i.toDouble(), monthlyPoints[i]),
                );

                final maxY =
                    (monthlyPoints.reduce((a, b) => a > b ? a : b) * 1.2)
                        .ceilToDouble();
                final leftStep = (maxY / 8).ceilToDouble();

                const bottomLabels = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec',
                ];

                return LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(handleBuiltInTouches: true),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: maxY,
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt().clamp(0, 11);
                            return SideTitleWidget(
                              meta: meta,
                              child: Center(
                                child: Text(
                                  bottomLabels[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: leftStep,
                          getTitlesWidget: (value, meta) {
                            if ((value / leftStep) % 1 != 0)
                              return const SizedBox.shrink();
                            return SideTitleWidget(
                              meta: meta,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.toStringAsFixed(0),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        isStrokeCapRound: true,
                        preventCurveOverShooting: true,
                        curveSmoothness: 0.15,
                        color: primary,
                        barWidth: 2.5,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              primary.withOpacity(0.5),
                              primary.withOpacity(0.1),
                            ],
                          ),
                        ),
                        dotData: FlDotData(show: false),
                        spots: spots,
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOutCubic,
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
