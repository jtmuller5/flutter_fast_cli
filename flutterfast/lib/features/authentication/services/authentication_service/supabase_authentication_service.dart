import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:crypto/crypto.dart';
import 'package:universal_io/io.dart';

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

    _supabase.auth.onAuthStateChange.listen((AuthState state) {
      if (state.event == AuthChangeEvent.signedIn) {
        if (state.session?.user.id != null) {
          userService.createUser().then(
            ((value) {
              onSignedIn(state.session!.user.id);
              navigationService.navigateToHome();
            }),
          );
        }
      } else if (state.event == AuthChangeEvent.initialSession) {
        if (state.session != null) onSignedIn(state.session!.user.id);
      } else if (state.event == AuthChangeEvent.signedOut) {
        onSignedOut();
      }
    });
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) {
    return _supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return _supabase.auth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) {
    return _supabase.auth.signUp(email: email, password: password);
  }

  @override
  Future<void> signInWithApple() async {
    try {
      if (Platform.isIOS) {
        final rawNonce = _supabase.auth.generateRawNonce();
        final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
        debugPrint('test');
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: hashedNonce,
        );

        final idToken = credential.identityToken;
        if (idToken == null) {
          throw const AuthException('Could not find ID Token from generated credential.');
        }

        await _supabase.auth.signInWithIdToken(
          provider: OAuthProvider.apple,
          idToken: idToken,
          nonce: rawNonce,
        );
      } else {
        const redirectTo = kIsWeb ? "https://xgiwtcbryqkepaaftabz.supabase.co/auth/v1/callback" : "com.cotr.flutterfast://login-callback/";

        await _supabase.auth.signInWithOAuth(
          OAuthProvider.apple,
          redirectTo: redirectTo, // 'my-scheme://login-callback',
          authScreenLaunchMode: LaunchMode.platformDefault,
        );
      }
    } on SignInWithAppleAuthorizationException catch (e) {
      debugPrint('Error signing in with Apple: $e');
      throw e.message;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      /// Web Client ID that you registered with Google Cloud.
      const webClientId = String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');

      /// iOS Client ID that you registered with Google Cloud.
      const iosClientId = String.fromEnvironment('GOOGLE_IOS_CLIENT_ID');

      // Google sign in on Android will work without providing the Android
      // Client ID registered on Google Cloud.

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    await _supabase.auth.signInWithOtp(phone: phoneNumber);
  }
}
