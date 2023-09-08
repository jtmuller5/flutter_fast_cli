import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:flutterfast/features/shared/ui/app_logo.dart';

@supabase
@Singleton(as: FastAuthenticationService)
class SupabaseAuthenticationService extends FastAuthenticationService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  bool get loggedIn => _supabase.auth.currentSession != null;

  @override
  String? get id => _supabase.auth.currentUser?.id;

  @override
  String? get email => _supabase.auth.currentUser?.email;

  @override
  Future<void> initialize() async {
    await Supabase.initialize(
      url: const String.fromEnvironment('SUPABASE_URL'),
      anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
    );
  }

  @override
  Widget forgotPasswordScreen(String? email) {
    return Scaffold(
      body: SupaResetPassword(
        accessToken: _supabase.auth.currentSession?.accessToken,
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
              await _supabase.auth.signOut();
              router.pushAndPopUntil(const SignInRoute(), predicate: (route) => false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget registerScreen() => signIn();

  @override
  Widget signInScreen() => signIn();

  Widget signIn() {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(24),
          children: [
            const AppLogo(sideLength: 200),
            SupaEmailAuth(
              redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
              onSignInComplete: (response) {
                debugPrint('onSignInComplete');
                router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
              },
              onSignUpComplete: (response) async {
                debugPrint('onSignUpComplete');
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
          ],
        ),
      ),
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return _supabase.auth.signOut();
  }
}
