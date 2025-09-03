import 'package:binhi/core/constants.dart';
import 'package:binhi/core/helper/helper.dart';
import 'package:binhi/providers/provider.dart';
import 'package:binhi/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recents extends ConsumerWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentActivityAsync = ref.watch(recentActivityProvider);

    return Flexible(
      flex: 4,
      child: CustomContainer(
        height: 650,
        padding: const EdgeInsets.all(20),
        child: recentActivityAsync.when(
          data: (activityResponse) {
            final activities = activityResponse.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Activity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${activities.length} items",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
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
                      final isEarned = activity.activityType == "earn";
                      final isRedeemed = activity.activityType == "redeem";

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
                                ? primary
                                : isRedeemed
                                ? Colors.orange
                                : blue,
                          ),
                        ),
                        title: Text(
                          "${activity.rewardAccountID} ${isEarned
                              ? 'earned'
                              : isRedeemed
                              ? 'redeemed'
                              : 'activity'} ${activity.points.abs()} points",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          formatActivityTime(activity.activityTime),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[600]),
                        ),

                        trailing: const Icon(Icons.chevron_right, size: 20),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
