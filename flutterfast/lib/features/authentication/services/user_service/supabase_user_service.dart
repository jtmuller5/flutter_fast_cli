import 'package:flutter/foundation.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/features/authentication/models/fast_user.dart';
import 'package:flutterfast/features/authentication/services/user_service/fast_user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@supabase
@LazySingleton(as: FastUserService)
class SupabaseUserService extends FastUserService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<void> createUser() async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) return null;

      FastUser newUser = FastUser(
        id: user.id,
        email: user.email,
        createdAt: DateTime.now(),
      );

      await _supabase.from('users').upsert(newUser.toJson(), onConflict: 'id');
    } catch (e) {
      debugPrint('Error creating user: $e');
      rethrow;
    }
    return null;
  }

  @override
  Future<FastUser?> getUser() async {
    try {
      final Map<String, dynamic> user = await _supabase.from('users').select().eq('id', _supabase.auth.currentUser!.id).single();

      FastUser loadedUser = FastUser.fromJson(user);
      debugPrint('loadedUser: ' + loadedUser.toString());
      setUser(loadedUser);
      return loadedUser;
    } catch (e) {
      debugPrint('Error getting user: $e');
      await authenticationService.signOut();
      router.replace(SignInRoute());
      return null;
    }
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    _supabase.from('users').delete().eq('id', user.id!);
  }

  @override
  Future<void> updateUser(FastUser user) {
    debugPrint('Updating user: ${user.toJson()}');
    return _supabase.from('users').update(user.toJson()).eq('id', user.id!);
  }

  @override
  Future<void> updateLastLogin() async {
    try {
      await _supabase.from('users').update({
        'last_login': DateTime.now().toIso8601String(),
      }).eq('id', _supabase.auth.currentUser!.id);
    } catch (e) {
      debugPrint('Error updating last login: $e');
    }
  }
}
