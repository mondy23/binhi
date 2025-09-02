import 'package:binhi/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {"title": "User 101 earned 120 points", "time": "Today, 9:00 AM"},
      {"title": "User 202 redeemed 80 points", "time": "Today, 1:30 PM"},
      {"title": "User 303 earned 50 points", "time": "Yesterday, 5:45 PM"},
      {"title": "User 404 expired 20 points", "time": "2 days ago"},
    ];

    return Flexible(
      flex: 4,
      child: CustomContainer(
        height: 650,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title + subtle count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Activity",
                  // style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 16,
                  //     ),
                ),
                Text(
                  "${activities.length} items",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Activity list
            Expanded(
              child: ListView.separated(
                itemCount: activities.length,
                separatorBuilder: (_, __) => Divider(
                  color: Colors.grey[300],
                  height: 20,
                  thickness: 0.6,
                ),
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  final isEarned = activity["title"]!.contains("earned");
                  final isRedeemed = activity["title"]!.contains("redeemed");

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundColor: isEarned
                          ? Colors.green.shade100
                          : isRedeemed
                              ? Colors.orange.shade100
                              : Colors.blue.shade100,
                      child: Icon(
                        isEarned
                            ? Icons.add_circle
                            : isRedeemed
                                ? Icons.remove_circle
                                : Icons.history,
                        color: isEarned
                            ? Colors.green
                            : isRedeemed
                                ? Colors.orange
                                : Colors.blue,
                      ),
                    ),
                    title: Text(
                      activity["title"]!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    subtitle: Text(
                      activity["time"]!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 20),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
