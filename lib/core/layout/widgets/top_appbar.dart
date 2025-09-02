import 'package:flutter/material.dart';

class TopAppbar extends StatelessWidget {
  const TopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
        ],
      ),
    );
  }
}
