import 'package:binhi/features/customer/widgets/recent_activity.dart';
import 'package:binhi/features/customer/widgets/customer_table.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Expanded(flex: 2, child: CustomerTable()),
            SizedBox(width: 16),
            Expanded(child: RecentCardWidget(isOpen: false,)),
          ],
        ),
      ),
    );
  }
}
