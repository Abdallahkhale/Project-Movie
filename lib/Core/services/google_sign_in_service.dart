import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _initialized = false;

  Future<void> initialize() async {
    if (!_initialized) {
      await _googleSignIn.initialize(
          serverClientId:
              "503107896573-r9hnku58nohrjn6rg897lucravvrq1br.apps.googleusercontent.com");
      _initialized = true;
    }
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    await initialize();
    try {
      final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      return account;
    } catch (e) {
      print('Sign-in failed: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
