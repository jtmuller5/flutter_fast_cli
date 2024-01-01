import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/models/fast_user.dart';
import 'package:flutterfast/features/authentication/services/user_service/fast_user_service.dart';

@firebase
@LazySingleton(as: FastUserService)
class FirebaseUserService extends FastUserService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> createUser() async {
    DocumentReference docRef =
        firestore.collection('users').doc(authenticationService.id);
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
  
  @override
  Future<FastUser?> getUser() {
    return firestore.collection('users').doc(authenticationService.id).get().then((value) {
      if (value.exists) {
        FastUser loadedUser = FastUser.fromJson(value.data()!);
        setUser(loadedUser);
        return loadedUser;
      } else {
        return null;
      }
    });
  }
}
