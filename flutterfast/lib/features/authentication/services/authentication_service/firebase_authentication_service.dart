import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:flutterfast/firebase_options.dart';

@firebase
@Singleton(as: FastAuthenticationService)
class FirebaseAuthenticationService extends FastAuthenticationService {
  @override
  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  String? get id => FirebaseAuth.instance.currentUser?.uid;

  @override
  String? get email => FirebaseAuth.instance.currentUser?.email;

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Widget forgotPasswordScreen(String? email) {
    return ForgotPasswordScreen(email: email);
  }

  @override
  Widget profileScreen() {
    return ProfileScreen(
      showMFATile: false,
      avatar: const SizedBox.shrink(),
      appBar: AppBar(title: const Text('Profile')),
      actions: [
        SignedOutAction((context) {
          router.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        }),
      ],
    );
  }

  @override
  Widget registerScreen() {
    return RegisterScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset('assets/images/logo.png'),
        );
      },
      sideBuilder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24),
            const Text('flutterfast'),
          ],
        );
      },
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        }),
      ],
    );
  }

  @override
  Widget signInScreen() {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset('assets/images/logo.png'),
        );
      },
      sideBuilder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24),
            const Text('flutterfast'),
          ],
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }),
        AuthStateChangeAction<UserCreated>((context, state) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        })
      ],
    );
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
