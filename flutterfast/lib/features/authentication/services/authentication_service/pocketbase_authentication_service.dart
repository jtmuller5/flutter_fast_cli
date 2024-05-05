import 'package:flutter/material.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

PocketBase get pb => PocketBase(
      const String.fromEnvironment('POCKETBASE_URL'),
      authStore: AsyncAuthStore(
        save: (String data) async => sharedPrefs.setString('pb_auth', data),
        initial: sharedPrefs.getString('pb_auth'),
      ),
    );

@pocketbase
@Singleton(as: FastAuthenticationService)
class PocketBaseAuthenticationService extends FastAuthenticationService {
  @override
  String? get email => pb.authStore.model.email;

  @override
  String? get id => pb.authStore.model.id;

  @override
  Future<void> initialize() async {}

  @override
  bool get loggedIn => pb.authStore.isValid;

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      await pb.collection('users').create(body: {
        "email": email,
        "password": password,
        "passwordConfirm": password,
        "emailVisibility": true,
      });

      await signInWithEmailAndPassword(email: email, password: password);
      onSignedIn(pb.authStore.model.id);
      navigationService.navigateToHome();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final authData = await pb.collection('users').authWithPassword(email, password);
      onSignedIn(pb.authStore.model.id);
      navigationService.navigateToHome();

      debugPrint('pb.authStore.isValid: ' + pb.authStore.isValid.toString());
      debugPrint('token: ' + pb.authStore.token);
      debugPrint('id: ' + pb.authStore.model.id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    pb.authStore.clear();
  }

  @override
  Future<void> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
