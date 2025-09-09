// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sidebar')),
        body: ListView(
          children: const [
            ListTile(title: Text('Home')),
            ListTile(title: Text('My Listings')),
            ListTile(title: Text('Orders')),
            ListTile(title: Text('Settings')),
          ],
        ));
  }
}
