// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Account')),
        body: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(title: Text('My Account')),
                ListTile(title: Text('Address')),
                ListTile(title: Text('Payment methods')),
              ],
            )));
  }
}
