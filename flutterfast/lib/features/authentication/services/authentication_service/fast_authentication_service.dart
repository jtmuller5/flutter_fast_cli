import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';

abstract class FastAuthenticationService {
  bool get loggedIn;

  String? get id;

  String? get email;

  Future<void> initialize();

  Future<void> signOut();

  Future<void> signInWithEmailAndPassword({required String email, required String password});

    Future<void> registerWithEmailAndPassword({required String email, required String password});

  Future<void> createAccountNavigation() async {
    await userService.createUser();
    router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
  }

  Future<void> signInNavigation() async {
    router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
  }

  Future<void> sendPasswordResetEmail(String email);
}
