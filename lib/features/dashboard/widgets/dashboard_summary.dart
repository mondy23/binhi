import 'package:flutter/material.dart';

class DashboardSummary extends StatelessWidget {
  const DashboardSummary({super.key});

  Widget _buildStatCard({
    required String title,
    required String value,
    required String iconUrl,
    required Color primary,
  }) {
    return SizedBox(
      height: 116,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: primary.withOpacity(0.1),
              radius: 22,
              child: Image.asset(iconUrl, color: primary,),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: "Total Released Points",
            value: "120,000",
            iconUrl: 'assets/icons/UpwardTrend.png',
            primary: primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: "Total Redeemed Points",
            value: "85,000",
            iconUrl: 'assets/icons/DownwardTrend.png',
            primary: primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: "Total Expired Points",
            value: "5,300",
            iconUrl: 'assets/icons/Activity.png',
            primary: primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: "Total Customers",
            value: "1,240",
            iconUrl: 'assets/icons/Customers.png',
            primary: primary,
          ),
        ),
      ],
    );
  }
}
