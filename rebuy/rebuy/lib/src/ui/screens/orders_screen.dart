import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView.separated(
        padding: const EdgeInsets.all(G.pad),
        itemBuilder: (_, i) => const CardTile(child: ListTile(leading: Icon(Icons.receipt_long_outlined), title: Text('Order #12345'), subtitle: Text('Delivered'), trailing: Icon(Icons.chevron_right))),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 6,
      ),
    );
  }
}
