// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Liked')),
        body: ListView(
          children: List.generate(
            5,
            (i) => Card(child: ListTile(title: Text('Liked item ${i + 1}'))),
          ),
        ));
  }
}
