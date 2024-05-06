Each Flutter Fast app has a single implementation of the `FastAuthenticationService`:

```dart
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';

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
```

In all cases, navigation from the sign in and register pages is handled inside the authentication service. This is to ensure that the user is automatically navigated to the next page after the user signs in, regardless of the method they use.

| Platform | Listen to Auth |
|----------|----------------|
| Firebase | `auth.authStateChanges()` |
| Supabase | `auth.onAuthStateChange()` |
| Appwrite | N/A |
| PocketBase | N/A |