import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = [
      {'icon': Icons.flash_on, 'label': 'Electricity', 'color': Colors.orange},
      {'icon': Icons.wifi, 'label': 'Internet', 'color': Colors.blue},
      {'icon': Icons.water_drop, 'label': 'Water', 'color': Colors.lightBlue},
      {'icon': Icons.phone_android, 'label': 'Mobile Postpaid', 'color': Colors.green},
      {'icon': Icons.verified_user, 'label': 'Insurance', 'color': Colors.red},
      {'icon': Icons.credit_card, 'label': 'Credit Card', 'color': Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pay Bills", style: TextStyle(color: AppTheme.textMain)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textMain),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                ),
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: (bills[index]['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(bills[index]['icon'] as IconData, color: bills[index]['color'] as Color, size: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        bills[index]['label'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
