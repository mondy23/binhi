import 'package:binhi/core/layout/widgets/top_appbar.dart';
import 'package:binhi/features/customer/widgets/customer_table.dart';
import 'package:binhi/features/customer/widgets/customers_linechart.dart';
import 'package:binhi/features/customer/widgets/top_earners.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          children: [
            TopAppbar(title: 'Customers',),
            Row(
              children: [
                Expanded(flex: 2, child: CustomerLineChartCard()),
                SizedBox(width: 16,),
                Expanded(child: TopEarners())
              ],
            ),
            SizedBox(height: 16,),
            Expanded(child: CustomerTable()),
          ],
        ),
      ),
    );
  }
}
