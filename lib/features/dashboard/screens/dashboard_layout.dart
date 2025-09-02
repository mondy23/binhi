
import 'package:binhi/core/constants.dart';
import 'package:binhi/features/dashboard/widgets/customers_linechart.dart';
import 'package:binhi/features/dashboard/widgets/dashboard_summary.dart';
import 'package:binhi/features/dashboard/widgets/recents.dart';
import 'package:binhi/features/dashboard/widgets/redeemed_graph.dart';
import 'package:binhi/features/dashboard/widgets/released_graph.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _headerWidget(context),
          const SizedBox(height: 24),
         DashboardSummary(),
          const SizedBox(height: kSpacing),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LineChartCard(),
                    const SizedBox(height: kSpacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ReleasedGraph()),
                        const SizedBox(width: kSpacing),
                        Expanded(child: RedeemedGraph()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kSpacing),

              Expanded(
                flex: 4,
                child: Recents(),
              ),
            ],
          ),

          const SizedBox(height: kSpacing),
        ],
      ),
    );
  }
}

Widget _headerWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "👋 Hello, Ottokonek!",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      SizedBox(
        height: 40,
        child: ElevatedButton.icon(
          onPressed: () {
            // TODO: implement export logic
          },
          icon: const Icon(Icons.download, size: 18),
          label: const Text("Export"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    ],
  );
}
