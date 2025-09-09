// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, i) => ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('User $i'),
              subtitle: const Text('Typing...')),
        ));
  }
}
