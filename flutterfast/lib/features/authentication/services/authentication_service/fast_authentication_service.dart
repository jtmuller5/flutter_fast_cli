import 'package:flutter/material.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';

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

  Future<void> createAccountNavigation() async {
    await userService.createUser();
    router.pushAndPopUntil(const OnboardingRoute(),
        predicate: (route) => false);
  }

  Future<void> signInNavigation() async {
    router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
  }
}
