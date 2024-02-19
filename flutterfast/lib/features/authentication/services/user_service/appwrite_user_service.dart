import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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
  String get databaseId => String.fromEnvironment('APPWRITE_DATABASE_ID');
  String get collectionId => 'users';

  @override
  Future<void> createUser() async {
    try {
      String? id = authenticationService.id;

      if (id != null) {
        await databases.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: id,
          data: FastUser(
            id: id,
            createdAt: DateTime.now(),
          ).toJson(),
        );
      }
    } on AppwriteException catch (e) {
      debugPrint(e.message);
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return null;
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    await databases.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: user.id!,
    );
  }

  @override
  Future<void> updateUser(FastUser user) async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: user.id!,
      data: user.toJson(),
    );
  }

  @override
  Future<FastUser?> getUser() {
    return databases
        .getDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: authenticationService.id!,
    )
        .then((value) {
      if (value.data != null) {
        FastUser loadedUser = FastUser.fromJson(value.data!);
        setUser(loadedUser);
        return loadedUser;
      } else {
        return null;
      }
    });
  }

  @override
  Future<void> updateLastLogin() async {
    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: authenticationService.id!,
      data: {
        'last_login': DateTime.now(),
      },
    );
  }
}
