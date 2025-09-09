import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, size: 84, color: Colors.green),
            SizedBox(height: 12),
            Text('Order Confirmed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            SizedBox(height: 6),
            Text('Thanks for your purchase!',
                style: TextStyle(color: AppColors.subtext)),
          ],
        ),
      ),
    );
  }
}
