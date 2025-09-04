import 'package:binhi/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<DataColumn> col;
  final List<DataRow> row;
  final String title;
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<String> onSearchChanged;
  final String total;

  const CustomTable({
    super.key,
    required this.col,
    required this.row,
    required this.title,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.onSearchChanged,
    this.total = '',
  });

  @override
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Search Row
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    total,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 18,
          
                    ),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dataTableTheme: const DataTableThemeData(
                      dividerThickness: 0,
                    ),
                  ),
                  child: DataTable(
                    showCheckboxColumn: false,
                    headingTextStyle: const TextStyle(fontSize: 16),
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        width: 1.5,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    columns: col,
                    rows: row,
                  ),
                ),
              ),
          
              const SizedBox(height: 24),
          
              // Pagination
              Align(
                alignment: Alignment.centerRight,
                child: CustomPagination(
                  currentPage: currentPage,
                  totalPages: totalPages,
                  onPageChanged: onPageChanged,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

int getMaxItem(BoxConstraints constraints, {int approxHeader = 150}) {
  const int itemHeight = 54; // default row height
  final double usableHeight =
      constraints.maxHeight - approxHeader; // approx padding/header
  final int itemCount = (usableHeight ~/ itemHeight).clamp(1, 100); // min 1
  return itemCount;
}

int getTotalPages(int totalItems, int limit) {
  if (limit == 0) return 1; // avoid division by zero
  return (totalItems / limit).ceil();
}
