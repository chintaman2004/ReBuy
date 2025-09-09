// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Listings')),
        body: ListView(
          children: List.generate(
            4,
            (i) => Card(child: ListTile(title: Text('My listing ${i + 1}'))),
          ),
        ));
  }
}
