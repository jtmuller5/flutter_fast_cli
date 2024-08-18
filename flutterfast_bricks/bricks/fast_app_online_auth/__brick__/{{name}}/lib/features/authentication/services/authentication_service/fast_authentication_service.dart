import 'package:{{ name }}/app/router.dart';
import 'package:{{ name }}/app/services.dart';

abstract class FastAuthenticationService {
  bool get loggedIn;

  String? get id;

  String? get email;

  Future<void> initialize();

  Future<void> signOut();

  Future<void> signInWithEmailAndPassword({required String email, required String password});

  Future<void> signInWithPhoneNumber({required String phoneNumber});

  Future<void> signInWithGoogle();

  Future<void> signInWithApple();

  Future<void> registerWithEmailAndPassword({required String email, required String password});

  Future<void> signInNavigation() async {
    router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
  }

  Future<void> sendPasswordResetEmail(String email);

  Future<void> resetPassword({required String newPassword});

  void onSignedIn(String userId) {
    analyticsService.updateUserId(userId);
    userService.updateLastLogin();
  }

  void onSignedOut() {
    analyticsService.updateUserId(null);
  }
}
