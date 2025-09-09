import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Payment',
              style: TextStyle(fontWeight: FontWeight.w700))),
      body: const Padding(
        padding: EdgeInsets.all(G.pad),
        child: Column(
          children: [
            CardTile(
                child: ListTile(
                    title: Text('Visa **** 1234'),
                    subtitle: Text('Expiry 12/28'),
                    trailing:
                        Icon(Icons.check_circle, color: AppColors.pinkDark))),
            SizedBox(height: 10),
            CardTile(
                child: ListTile(
                    title: Text('Cash on Delivery'),
                    trailing: Icon(Icons.radio_button_unchecked))),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(G.pad),
        child: PinkButton(
            text: 'Pay Now', onPressed: () => Get.toNamed(Routes.confirmation)),
      ),
    );
  }
}
