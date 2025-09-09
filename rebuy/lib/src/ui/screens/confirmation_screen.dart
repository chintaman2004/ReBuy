// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Confirmation')),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 72),
              SizedBox(height: 12),
              Text('Order Confirmed')
            ],
          ),
        ));
  }
}
