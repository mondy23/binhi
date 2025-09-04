import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstPage = currentPage == 1;
    final isLastPage = currentPage == totalPages;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: isFirstPage ? null : () => onPageChanged(currentPage - 1),
        ),
        Text('Page $currentPage of $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: isLastPage ? null : () => onPageChanged(currentPage + 1),
        ),
      ],
    );
  }
}
