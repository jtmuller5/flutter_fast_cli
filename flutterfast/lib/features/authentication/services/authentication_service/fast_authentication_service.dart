import 'package:flutter/material.dart';

abstract class FastAuthenticationService {
  bool get loggedIn;

  String? get id;

  String? get email;

  Future<void> initialize();

  Future<void> signOut();

  Future<void> signInWithEmailAndPassword(String email, String password);

  Widget signInScreen();

  Widget registerScreen();

  Widget forgotPasswordScreen(String? email);

  Widget profileScreen();
}
