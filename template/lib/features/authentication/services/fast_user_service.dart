import 'package:template/features/authentication/models/fast_user.dart';

abstract class FastUserService {
  Future<void> createUser(FastUser user);

  Future<void> updateUser(FastUser user);

  Future<void> deleteUser(FastUser user);
}