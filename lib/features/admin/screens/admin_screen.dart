import 'dart:math';
import 'package:binhi/core/layout/widgets/top_appbar.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class MerchantScreen extends StatelessWidget {
  const MerchantScreen({super.key});

  final String defaultProfile =
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

  // Solid background colors to pick from
 final List<Color> bgColors = const [
  Color(0xFF93C5FD), // soft blue
  Color(0xFF6EE7B7), // soft green
  Color(0xFFFCD34D), // soft amber
  Color(0xFFA78BFA), // soft purple
  Color(0xFFFCA5A5), // soft red/pink
  Color(0xFF67E8F9), // soft cyan/teal
];


  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      body: Column(
        children: [
          const TopAppbar(title: 'Merchants'),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final bgColor = bgColors[random.nextInt(bgColors.length)];

                return CustomContainer(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile background with avatar
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Positioned(
                            bottom: -24,
                            left: 16,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(defaultProfile),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Merchant name
                      Text(
                        "Merchant $index",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),

                      // Total Customers
                      Text(
                        "120 Customers",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 12),

                      // Released & Redeemed
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _Stat(label: "Released", value: "15k", color: Colors.green),
                          _Stat(label: "Redeemed", value: "9.5k", color: Colors.red),
                        ],
                      ),

                      const Spacer(),

                      // Subtitle
                      Text(
                        "E-commerce | Retail",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _Stat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }
}
