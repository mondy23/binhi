import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAppbar extends ConsumerWidget {
  final String title;
  const TopAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
        ],
      ),
    );
  }
}
