import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:template/app/get_it.dart';
import 'package:template/app/services.dart';
import 'package:template/features/authentication/models/fast_user.dart';
import 'package:template/features/authentication/services/user_service/fast_user_service.dart';

@firebase
@LazySingleton(as: FastUserService)
class FirebaseUserService extends FastUserService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> createUser() async {
    DocumentReference docRef = firestore.collection('users').doc(authenticationService.id);
    await docRef.set(FastUser(
      id: docRef.id,
      createdAt: DateTime.now(),
    ).toJson());
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    await firestore.collection('users').doc(user.id).delete();
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Future<void> updateUser(FastUser user) async {
    await firestore.collection('users').doc(user.id).update(user.toJson());
  }
}
