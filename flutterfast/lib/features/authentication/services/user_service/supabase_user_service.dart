import 'package:flutter/foundation.dart';
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

      FastUser newUser = FastUser(
        id: user!.id,
        createdAt: DateTime.now(),
      );

      await _supabase.from('users').insert(newUser.toJson());
    } catch (e) {
      debugPrint('Error creating user: ' + e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    _supabase.from('users').delete().eq('id', user.id);
  }

  @override
  Future<void> updateUser(FastUser user) {
    return _supabase.from('users').update(user.toJson()).eq('id', user.id);
  }
}
