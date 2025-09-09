// lib/src/controllers/auth_controller.dart
// ignore_for_file: unused_local_variable, unused_element

import 'dart:io';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  final isBusy = false.obs;

  /// Email / password – keep your existing logic
  Future<void> loginWithEmail(String email, String password) async {
    isBusy.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      Get.snackbar('Logged in', 'Email session started');
    } finally {
      isBusy.value = false;
    }
  }

  /// GOOGLE
  Future<void> signInWithGoogle() async {
    isBusy.value = true;
    try {
      final google = GoogleSignIn(
        scopes: const ['email', 'profile'],
        // If you have a Web/iOS client id, add it:
        // clientId: 'YOUR_WEB_OR_IOS_CLIENT_ID.apps.googleusercontent.com',
      );

      final account = await google.signIn();
      if (account == null) return; // user cancelled

      final auth = await account.authentication;
      final idToken = auth.idToken; // send to backend (recommended)
      final accessToken = auth.accessToken;

      Get.snackbar(
          'Google', 'Signed in as ${account.displayName ?? account.email}');
    } finally {
      isBusy.value = false;
    }
  }

  /// FACEBOOK
  Future<void> signInWithFacebook() async {
    isBusy.value = true;
    try {
      final res = await FacebookAuth.instance
          .login(); // permissions default to ['email','public_profile']
      if (res.status != LoginStatus.success) return;
      final token = res.accessToken!.token; // send to backend
      // final userData = await FacebookAuth.instance.getUserData();
      Get.snackbar('Facebook', 'Signed in successfully');
    } finally {
      isBusy.value = false;
    }
  }

  /// APPLE (iOS/macOS only)
  Future<void> signInWithApple() async {
    if (!Platform.isIOS && !Platform.isMacOS) {
      Get.snackbar('Apple Sign-In', 'Available only on iOS/macOS');
      return;
    }
    isBusy.value = true;
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
      );
      final idToken = credential.identityToken; // send to backend
      Get.snackbar('Apple', 'Signed in successfully');
    } finally {
      isBusy.value = false;
    }
  }
}

// extension on AccessToken {
//   get token => null;
// }
