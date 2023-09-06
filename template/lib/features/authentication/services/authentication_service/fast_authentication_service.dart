import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FastAuthenticationService {
  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  String? get id => FirebaseAuth.instance.currentUser?.uid;

  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> initialize();

  Future<void> signOut();

  Future<void> signInWithEmailAndPassword(String email, String password);

  Widget signInScreen();

  Widget registerScreen();

  Widget forgotPasswordScreen(String? email);

  Widget profileScreen();
}
