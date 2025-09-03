import 'package:binhi/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class TopEarners extends StatelessWidget {
  const TopEarners({super.key});

  final List<Map<String, dynamic>> topEarners = const [
    {'id': 'USR001', 'points': 1200},
    {'id': 'USR002', 'points': 1100},
    {'id': 'USR003', 'points': 950},
    {'id': 'USR004', 'points': 900},
    {'id': 'USR005', 'points': 850},
    {'id': 'USR006', 'points': 800},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 330,
      padding: const EdgeInsets.all(16), // 2x8pt
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Earners',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16), // 2x8pt spacing
          Expanded(
            child: ListView.builder(
              itemCount: topEarners.length,
              itemBuilder: (context, index) {
                final user = topEarners[index];

                // Decide icon based on ranking
                Icon leadingIcon;
                switch (index) {
                  case 0:
                    leadingIcon = const Icon(Icons.emoji_events, color: Colors.amber);
                    break;
                  case 1:
                    leadingIcon = const Icon(Icons.emoji_events, color: Colors.grey);
                    break;
                  case 2:
                    leadingIcon = const Icon(Icons.emoji_events, color: Colors.brown);
                    break;
                  default:
                    leadingIcon = const Icon(Icons.person, color: Colors.blueGrey);
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8), // 8pt spacing
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          leadingIcon,
                          const SizedBox(width: 8), // 8pt spacing
                          Text(user['id']),
                        ],
                      ),
                      Text(
                        user['points'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
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
