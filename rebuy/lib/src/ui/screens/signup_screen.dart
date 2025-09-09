import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
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
        const SizedBox(height: 8),
        const TextField(decoration: InputDecoration(labelText: 'Confirm Password'), obscureText: true),
        const SizedBox(height: 16),
        FilledButton(onPressed: ()=>Get.toNamed(Routes.home), child: const Text('Sign up'))
      ],
    ),
  ),
)

    );
  }
}
