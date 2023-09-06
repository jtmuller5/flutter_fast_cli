import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:template/features/authentication/models/fast_user.dart';
import 'package:template/features/authentication/services/user_service/fast_user_service.dart';
import 'package:template/main.dart';

@supabase
@LazySingleton(as: FastUserService)
class SupabaseUserService extends FastUserService {

  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<void> createUser() async {

    final user = _supabase.auth.currentUser;

    FastUser newUser = FastUser(
      id: user!.id,
      createdAt: DateTime.now(),
    );

    await _supabase.from('users').upsert(newUser.toJson());
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