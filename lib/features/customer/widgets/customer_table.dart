import 'package:binhi/core/constants.dart';
import 'package:binhi/core/helper/helper.dart';
import 'package:binhi/providers/provider.dart';
import 'package:binhi/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomerTable extends ConsumerWidget {
  const CustomerTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentPage = ref.watch(customerCurrentPage);
    final asyncCustomer = ref.watch(customerProvider(_currentPage));

    return asyncCustomer.when(
      data: (customerResponse) {
        final customers = customerResponse.data;

        return Align(
          alignment: Alignment.topLeft,
          child: CustomTable(
            col: const [
              DataColumn(
                label: Text(
                  "ID",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Points",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Rank",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Progress",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Joined",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            row: customers.map((customer) {
              final rank = getRank(customer.totalPoints);
              final rankColor = getRankColor(rank);

              return DataRow(
                onSelectChanged: (selected) {
                  if (selected ?? false) {
                    debugPrint("Selected row: ${customer.accountIdentifier}");
                  }
                },
                cells: [
                  DataCell(
                    Text(
                      customer.accountIdentifier,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  DataCell(
                    Text(
                      customer.totalPoints.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        Icon(Icons.emoji_events, color: rankColor, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          rank,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: rankColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: getProgress(customer.totalPoints),
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      DateFormat("MMM d, y").format(customer.createdAt),
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                ],
              );
            }).toList(),
            title: '',
            currentPage: customerResponse.page,
            totalPages: customerResponse.totalPages,
            onPageChanged: (int value) {
              ref.read(customerCurrentPage.notifier).state = value;
            },
            onSearchChanged: (String value) {},
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
