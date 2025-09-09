import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: 
Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      const ListTile(title: Text('Payment Method'), subtitle: Text('Visa **** 1234')),
      const Spacer(),
      FilledButton(onPressed: ()=>Get.toNamed(Routes.confirmation), child: const Text('Pay Now'))
    ],
  ),
)

    );
  }
}
