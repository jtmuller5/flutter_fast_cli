import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/features/authentication/services/authentication_service/fast_authentication_service.dart';

class SupabaseAuthenticationService extends FastAuthenticationService {
  late final SupabaseClient supabase;

  @override
  Future<void> initialize() async {
    await Supabase.initialize(
      url: const String.fromEnvironment('SUPABASE_URL'),
      anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
    );

    supabase = Supabase.instance.client;
  }

  @override
  Widget forgotPasswordScreen(String? email) {
    return Scaffold(
      body: SupaResetPassword(
        accessToken: supabase.auth.currentSession?.accessToken,
        onSuccess: (UserResponse response) {
          // do something, for example: navigate('home');
        },
        onError: (error) {
          // do something, for example: navigate("wait_for_email");
        },
      ),
    );
  }

  @override
  Widget profileScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Sign Out'),
            onTap: () async {
              await supabase.auth.signOut();
              router.pushAndPopUntil(const SignInRoute(), predicate: (route) => false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget registerScreen() {
    return Scaffold(
      body: SupaEmailAuth(
        redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
        onSignInComplete: (response) {
          router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        },
        onSignUpComplete: (response) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        },
        metadataFields: [
          MetaDataField(
            prefixIcon: const Icon(Icons.person),
            label: 'Username',
            key: 'username',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter something';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget signInScreen() {
    return Scaffold(
      body: SupaEmailAuth(
        redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
        onSignInComplete: (response) {
          router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        },
        onSignUpComplete: (response) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        },
        metadataFields: [
          MetaDataField(
            prefixIcon: const Icon(Icons.person),
            label: 'Username',
            key: 'username',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter something';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
