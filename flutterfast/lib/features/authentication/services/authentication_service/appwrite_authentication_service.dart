import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@Singleton(as: FastAuthenticationService)
class AppwriteAuthenticationService extends FastAuthenticationService {
  Client client = Client();

  Account get account => Account(client);

  ValueNotifier<User?> user = ValueNotifier(null);

  void setUser(User val) {
    user.value = val;
  }

  @override
  String? get email => throw UnimplementedError();

  @override
  String? get id => user.value?.$id;

  @override
  Future<void> initialize() async {
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
        .setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

    account.get().then((value) => setUser(value));
  }

  @override
  bool get loggedIn => user.value != null;

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await account.createEmailSession(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await account.deleteSessions();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) async {
    await account.create(userId: email, email: email, password: password);
  }
}
