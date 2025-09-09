import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED), // outer grey like the mock
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top row: back button + brand
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
                    const Text(
                      'ReBuy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 32, height: 1.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),

                const Text(
                  'Sign up with one of the following options',
                  style: TextStyle(fontSize: 12, color: Color(0xFF8A8D93)),
                ),
                const SizedBox(height: 12),

                // social buttons (UI only for now)
                Row(
                  children: [
                    _socialBtn(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                        width: 18,
                        height: 18,
                      ),
                      onTap: () {}, // hook later
                    ),
                    const SizedBox(width: 12),
                    _socialBtn(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Logo_of_Twitter.svg',
                        width: 18,
                        height: 18,
                      ),
                      onTap: () {}, // hook later
                    ),
                    const SizedBox(width: 12),
                    _socialBtn(
                      child: const Icon(Icons.apple,
                          color: Colors.black87, size: 18),
                      onTap: () {}, // hook later
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // divider "Or"
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

                // inputs
                _roundedField(controller: nameCtrl, hint: 'Name'),
                const SizedBox(height: 12),
                _roundedField(
                    controller: emailCtrl,
                    hint: 'Email',
                    keyboard: TextInputType.emailAddress),
                const SizedBox(height: 12),
                _roundedField(
                    controller: passCtrl, hint: 'Password', obscure: true),
                const SizedBox(height: 16),

                // CTA → after sign-up go to Login
                SizedBox(
                  height: 46,
                  child: PinkButton(
                    text: 'Create account',
                    onPressed: () =>
                        Get.offAllNamed(Routes.login), // 🔑 changed
                  ),
                ),

                const SizedBox(height: 16),

                // already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.login),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Color(0xFFFF5F6D),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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

  static Widget _roundedField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
