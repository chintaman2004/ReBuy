import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: 
Center(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextField(decoration: InputDecoration(labelText: 'Email')),
        const SizedBox(height: 8),
        const TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
        const SizedBox(height: 16),
        FilledButton(onPressed: ()=>Get.toNamed(Routes.home), child: const Text('Log in')),
        TextButton(onPressed: ()=>Get.toNamed(Routes.signup), child: const Text('Create account'))
      ],
    ),
  ),
)

    );
  }
}
