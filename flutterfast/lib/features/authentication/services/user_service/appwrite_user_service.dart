import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/models/fast_user.dart';
import 'package:flutterfast/features/authentication/services/user_service/fast_user_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastUserService)
class AppwriteUserservice extends FastUserService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

  Databases get databases => Databases(client);

  @override
  Future<void> createUser() async {
    try {
      String? id = authenticationService.id;

      if (id != null) {
        await databases.createDocument(
          databaseId: 'general',
          collectionId: 'users',
          documentId: id,
          data: FastUser(
            id: id,
            createdAt: DateTime.now(),
          ).toJson(),
        );
      }
    } on AppwriteException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    await databases.deleteDocument(
      databaseId: 'general',
      collectionId: 'users',
      documentId: user.id,
    );
  }

  @override
  Future<void> updateUser(FastUser user) async{
    await databases.updateDocument(
      databaseId: 'general',
      collectionId: 'users',
      documentId: user.id,
      data: user.toJson(),
    );
  }
}
