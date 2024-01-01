import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
}
