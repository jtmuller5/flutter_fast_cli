String getFastUserServiceText(String appName){
  return '''
import 'package:$appName/features/authentication/models/fast_user.dart';

abstract class FastUserService {
  Future<void> createUser();

  Future<void> updateUser(FastUser user);

  Future<void> deleteUser(FastUser user);
}
''';
}

String getUserServiceText(String appName){
  appName = appName.toLowerCase();
  return '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:$appName/app/services.dart';
import 'package:$appName/features/authentication/models/fast_user.dart';
import 'package:$appName/features/authentication/services/fast_user_service.dart';

@LazySingleton(as: FastUserService)
class UserService extends FastUserService {
  @override
  Future<void> createUser() async {
    DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(authenticationService.id);
    await docRef.set(FastUser(
      id: docRef.id,
      createdAt: DateTime.now(),
    ).toJson());
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.id).delete();
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Future<void> updateUser(FastUser user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.id).update(user.toJson());
  }
}
''';
}