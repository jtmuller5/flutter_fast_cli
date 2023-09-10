import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_auth_ui/appwrite_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
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
  Widget forgotPasswordScreen(String? email) {
    // TODO: implement forgotPasswordScreen
    throw UnimplementedError();
  }

  @override
  String? get id => user.value?.$id;

  @override
  Future<void> initialize() async {
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
        .setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));
  }

  @override
  bool get loggedIn => user.value != null;

  @override
  Widget profileScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Sign Out'),
            onTap: () async {
              await account.deleteSessions();
              router.pushAndPopUntil(const SignInRoute(), predicate: (route) => false);
            },
          ),
        ],
      ));
  }

  @override
  Widget registerScreen() {
    return AppwriteSignup(
      title: 'Sign Up',
      successCallback: (userData) {
        createAccountNavigation();
      },
    );
  }

  @override
  Widget signInScreen() {
    return AppwriteSignin(
      title: 'Sign In',
      successCallback: (userData) {
        signInNavigation();
      },
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await account.createEmailSession(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await account.deleteSessions();
  }
}
