import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase')),
      body: 
Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      const ListTile(title: Text('Purchase Summary'), subtitle: Text('1 item')),
      const Spacer(),
      FilledButton(onPressed: ()=>Get.toNamed(Routes.payment), child: const Text('Proceed to Payment'))
    ],
  ),
)

    );
  }
}
