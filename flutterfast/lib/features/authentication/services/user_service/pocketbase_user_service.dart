import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/models/fast_user.dart';
import 'package:flutterfast/features/authentication/services/user_service/fast_user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@pocketbase
@Singleton(as: FastUserService)
class PocketBaseUserService extends FastUserService {
  PocketBase pb = PocketBase(const String.fromEnvironment('POCKETBASE_URL'));

  @override
  Future<void> createUser() {
    return Future.value();
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    pb.collection('users').delete(user.id!);
  }

  @override
  Future<FastUser?> getUser() async {
    RecordModel user = await pb.collection('users').getOne(authenticationService.id!);

    return FastUser.fromJson(user.toJson());
  }

  @override
  Future<void> updateUser(FastUser user) {
    return pb.collection('users').update(user.id!, body: user.toJson());
  }
}
