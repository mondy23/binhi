import 'package:binhi/core/constants.dart';
import 'package:flutter/material.dart';

class RecentCardWidget extends StatelessWidget {
  final bool isOpen;
  const RecentCardWidget({super.key, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    final data = ScheduleTaskData();

    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            "Recent Activity",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),

          // Activity List
          ListView.separated(
            shrinkWrap: true, // ✅ important
            physics:
                const NeverScrollableScrollPhysics(), // ✅ disables inner scrolling
            itemCount: data.schedule.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = data.schedule[index];
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.blue.shade50,
                            child: Icon(
                              item.type == "earned"
                                  ? Icons.add_card
                                  : item.type == "redeemed"
                                  ? Icons.card_giftcard
                                  : Icons.person_add,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.date,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                  
                      // Action
                      // IconButton(
                      //   icon: const Icon(
                      //     Icons.more_vert,
                      //     size: 18,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Mock data
class ScheduleTaskData {
  final schedule = [
    ScheduledModel(
      type: "earned",
      title: "UID 111 • +100 pts",
      date: "Today, 9:00 AM - 10:00 AM",
    ),
    ScheduledModel(
      type: "redeemed",
      title: "UID 231 • -50 pts",
      date: "Tomorrow, 5:00 PM - 6:00 PM",
    ),
    ScheduledModel(
      type: "created",
      title: "UID 123 • created",
      date: "Wednesday, 9:00 AM - 10:00 AM",
    ),
  ];
}

/// Model
class ScheduledModel {
  final String type; // earned, redeemed, created
  final String title;
  final String date;

  ScheduledModel({required this.type, required this.title, required this.date});
}
