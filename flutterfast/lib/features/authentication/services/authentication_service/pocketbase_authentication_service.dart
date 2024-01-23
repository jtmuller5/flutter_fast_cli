import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketBaseAuthenticationService extends FastAuthenticationService {
  PocketBase pb = PocketBase(const String.fromEnvironment('POCKETBASE_URL'));

  @override
  String? get email => null;

  @override
  String? get id => null;

  @override
  Future<void> initialize() async {
    final store = AsyncAuthStore(
      save: (String data) async => sharedPrefs.setString('pb_auth', data),
      initial: sharedPrefs.getString('pb_auth'),
    );

    pb = PocketBase(const String.fromEnvironment('POCKETBASE_URL'), authStore: store);
  }

  @override
  bool get loggedIn => pb.authStore.isValid;

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) async {
    final authData = await pb.collection('users').authWithPassword(email, password);

    debugPrint(pb.authStore.isValid.toString());
    debugPrint(pb.authStore.token);
    debugPrint(pb.authStore.model.id);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    final authData = await pb.collection('users').authWithPassword(email, password);

    debugPrint(pb.authStore.isValid.toString());
    debugPrint(pb.authStore.token);
    debugPrint(pb.authStore.model.id);
  }

  @override
  Future<void> signOut() async {
    pb.authStore.clear();
  }
}
