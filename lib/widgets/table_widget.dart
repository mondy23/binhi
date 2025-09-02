import 'package:binhi/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final String? title;

  const CustomTable({
    super.key,
    required this.columns,
    required this.rows,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
            ),
            const SizedBox(height: 16),
          ],
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: LayoutBuilder(
              builder: (context, constraints) => ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: DataTable(
                  headingRowColor:
                      MaterialStateProperty.all(primary.withOpacity(0.08)),
                  dataRowColor: MaterialStateProperty.all(
                    Colors.white.withOpacity(0.02),
                  ),
                  border: TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey.shade200, width: 0.7),
                  ),
                  columnSpacing: 32,
                  headingTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                  dataTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black87,
                      ),
                  dividerThickness: 0.7,
                  columns: columns,
                  rows: rows,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
