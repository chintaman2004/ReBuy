// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../controllers/auth_controller.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AuthController());
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED), // light outer gray like mock
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  8), // mock has slight rounding on the canvas
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: back & brand
                Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFDADADA)),
                      ),
                      child: const Icon(Icons.chevron_left, size: 22),
                    ),
                    const Spacer(),
                    const Text('ReBuy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        )),
                  ],
                ),
                const SizedBox(height: 24),

                const Text('Log in',
                    style: TextStyle(
                      fontSize: 32,
                      height: 1.0,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 10),

                const Text(
                  'Login with one of the following options',
                  style: TextStyle(fontSize: 12, color: Color(0xFF8A8D93)),
                ),
                const SizedBox(height: 12),

                // Social buttons row
                Obx(() => Row(
                      children: [
                        const SizedBox(width: 12),
                        _socialBtn(
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                              width: 18,
                              height: 18),
                          onTap: c.isBusy.value ? null : c.signInWithGoogle,
                        ),
                        const SizedBox(width: 12),
                        _socialBtn(
                          child: const Icon(Icons.apple,
                              color: Colors.black87, size: 18),
                          onTap: c.isBusy.value ? null : c.signInWithApple,
                        ),
                        const SizedBox(width: 12),
                        _socialBtn(
                          child: const Icon(Icons.facebook,
                              color: Color(0xFF1877F2), size: 18),
                          onTap: c.isBusy.value ? null : c.signInWithFacebook,
                        ),
                      ],
                    )),
                const SizedBox(height: 18),

                // Divider "Or"
                const Row(
                  children: [
                    Expanded(
                        child: Divider(thickness: 1, color: Color(0xFFE6E8EB))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or',
                          style: TextStyle(color: Color(0xFF8A8D93))),
                    ),
                    Expanded(
                        child: Divider(thickness: 1, color: Color(0xFFE6E8EB))),
                  ],
                ),
                const SizedBox(height: 18),

                // Inputs (rounded, grey fill)
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
                const SizedBox(height: 16),

                // Pink gradient login button
                Obx(() => GestureDetector(
                      onTap: c.isBusy.value
                          ? null
                          : () async {
                              await c.loginWithEmail(
                                  emailCtrl.text.trim(), passCtrl.text);
                              if (!c.isBusy.value) Get.toNamed(Routes.home);
                            },
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFF5F6D),
                              Color(0xFFB76ECB)
                            ], // matches your button
                          ),
                        ),
                        child: Center(
                          child: Text(
                            c.isBusy.value ? 'Please wait…' : 'Log in',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )),

                const SizedBox(height: 16),

                // Sign up row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.signup),
                      child: const Text('Sign up',
                          style: TextStyle(
                            color: Color(0xFFFF5F6D),
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialBtn({required Widget child, VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
