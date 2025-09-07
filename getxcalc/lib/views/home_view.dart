import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    final String username = Get.arguments ?? "Guest";

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/'); // back to login
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            "Counter: ${counterController.count}",
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
