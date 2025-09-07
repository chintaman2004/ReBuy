import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Enter your name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty) {
                  Get.to(
                    () => HomeView(),
                    arguments: usernameController.text,
                  ); // Passing name
                } else {
                  Get.snackbar(
                    "Error",
                    "Please enter your name",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
