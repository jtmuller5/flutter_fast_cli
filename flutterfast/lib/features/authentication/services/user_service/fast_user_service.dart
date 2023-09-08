import 'package:flutterfast/features/authentication/models/fast_user.dart';

abstract class FastUserService {
  Future<void> createUser();

  Future<void> updateUser(FastUser user);

  Future<void> deleteUser(FastUser user);
}