import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:template/app/services.dart';
import 'package:template/features/authentication/models/fast_user.dart';
import 'package:template/features/authentication/services/fast_user_service.dart';

@LazySingleton(as: FastUserService)
class FirebaseUserService extends FastUserService {
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
