// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: ListView(
          children: List.generate(
            6,
            (i) => Card(
              child: ListTile(
                  title: Text('Order #${1000 + i}'),
                  subtitle: const Text('Delivered')),
            ),
          ),
        ));
  }
}
