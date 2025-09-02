import 'package:binhi/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class CustomerTable extends StatelessWidget {
  const CustomerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTable(
      columns: const [
        DataColumn(label: Text("ID")),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Email")),
        DataColumn(label: Text("Points")),
        DataColumn(label: Text("Status")),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text("1")),
            DataCell(Text("John Doe")),
            DataCell(Text("john@example.com")),
            DataCell(Text("1200")),
            DataCell(Text("Active")),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("2")),
            DataCell(Text("Jane Smith")),
            DataCell(Text("jane@example.com")),
            DataCell(Text("900")),
            DataCell(Text("Inactive")),
          ],
        ),
      ],
    );
  }
}
