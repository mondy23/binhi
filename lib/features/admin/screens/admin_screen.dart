import 'package:binhi/core/constants.dart';
import 'package:binhi/core/layout/widgets/top_appbar.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class MerchantScreen extends StatelessWidget {
  const MerchantScreen({super.key});

  final String defaultProfile =
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          const TopAppbar(title: 'Merchants'),

          // 🔍 Search + ➕ Add button (8pt spacing)
          Row(
            children: [
              // Search bar
              Expanded(
                child: // 🔍 Search bar with shadow + border
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8), // 1*8
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
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search merchants...",
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
      prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(0.5),),
      border: InputBorder.none, // remove default border
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16, // 2*8
        vertical: 12,   // 1.5*8
      ),
    ),
  ),
)

              ),
              const SizedBox(width: 16), // 2*8
          
              // Add button
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Handle add merchant
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Merchant"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16, // 2*8
                    vertical: 16,   // 2*8
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 1*8
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: kSpacing,),
          // Merchant Grid
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16, // 2*8
                mainAxisSpacing: 16,  // 2*8
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return CustomContainer(
                  padding: const EdgeInsets.all(16), // 2*8
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile background with avatar
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 80, // 10*8
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(8), // 1*8
                            ),
                          ),
                          Positioned(
                            bottom: -24, // 3*8
                            left: 16,    // 2*8
                            child: CircleAvatar(
                              radius: 28, // 3.5*8
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(defaultProfile),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32), // 4*8 (space for avatar overlap)

                      // Merchant name
                      Text(
                        "Merchant $index",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8), // 1*8

                      // Total Customers
                      Text(
                        "120 Customers",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 16), // 2*8

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
        const SizedBox(height: 8), // 1*8
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
