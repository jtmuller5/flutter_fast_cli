import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/app/services.dart';
import 'package:{{ name }}/features/authentication/models/fast_user.dart';
import 'package:{{ name }}/features/authentication/services/user_service/fast_user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@pocketbase
@Singleton(as: FastUserService)
class PocketBaseUserService extends FastUserService {
  PocketBase pb = PocketBase(const String.fromEnvironment('POCKETBASE_URL'));

  @override
  Future<void> createUser() async {
    return Future.value();
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    pb.collection('users').delete(user.id!);
  }

  @override
  Future<FastUser?> getUser() async {
    if (authenticationService.id == null) throw Exception('User not authenticated');

    RecordModel user = await pb.collection('users').getOne(authenticationService.id!);

    FastUser fastUser = FastUser.fromJson(user.toJson());

    setUser(fastUser);

    return fastUser;
  }

  @override
  Future<void> updateUser(FastUser user) {
    return pb.collection('users').update(user.id!, body: user.toJson());
  }

  @override
  Future<void> updateLastLogin() async {
    await pb.collection('users').update(authenticationService.id!, body: {'last_login': DateTime.now()});
  }
}
