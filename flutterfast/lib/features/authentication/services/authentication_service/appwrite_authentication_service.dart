import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@Singleton(as: FastAuthenticationService)
class AppwriteAuthenticationService extends FastAuthenticationService {
  Client client = Client();

  Account get account => Account(client);

  ValueNotifier<Session?> session = ValueNotifier(null);

  void setSession(Session val) {
    session.value = val;
    debugPrint('session: ' + val.userId.toString());
  }

  ValueNotifier<User?> user = ValueNotifier(null);

  void setUser(User val) {
    user.value = val;
  }

  @override
  String? get email => throw UnimplementedError();

  @override
  String? get id => session.value?.userId;

  @override
  Future<void> initialize() async {
    try {
      client
          .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
          .setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

      // https://github.com/appwrite/appwrite/discussions/3938#discussioncomment-3746725
      User value = await account.get();
      Session _session = await account.getSession(sessionId: 'current');
      setUser(value);
      setSession(_session);
    } on AppwriteException catch (e) {
      debugPrint('Appwrite inititalization error: $e');
      debugPrint(e.message);
      debugPrint(e.code.toString());
      debugPrint(e.type);
    } catch (e) {
      debugPrint('Appwrite inititalization error: $e');
    }
  }

  @override
  bool get loggedIn => user.value != null;

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await account.createEmailSession(email: email, password: password);
      navigationService.navigateToHome();
    } on AppwriteException catch (e) {
      debugPrint('Error siging in: ' + e.toString());
      throw e.message ?? 'Error signing in';
    } catch (e) {
      debugPrint('Error siging in: ' + e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await account.deleteSessions();
    navigationService.navigateToSignIn();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      String id = ID.unique();
      await account.create(
        userId: id,
        email: email,
        password: password,
      );
      await account.createEmailSession(email: email, password: password);
      Session _session = await account.getSession(sessionId: 'current');
      setSession(_session);
      await userService.createUser();
      navigationService.navigateToHome();
    } on AppwriteException catch (e) {
      debugPrint('Error creating user: $e');
      throw e.message ?? 'Error creating user';
    } catch (e) {
      debugPrint('Error creating user: $e');
      rethrow;
    }
  }

  @override
  Future<void> signInWithApple() async {
    try {
      await account.createOAuth2Session(provider: 'apple');
      Session _session = await account.getSession(sessionId: 'current');
      setSession(_session);
      await userService.createUser();
      navigationService.navigateToHome();
    } on AppwriteException catch (e) {
      debugPrint('Error signing in with Apple: $e');
      throw e.message ?? 'Error signing in with Apple';
    } catch (e) {
      debugPrint('Error signing in with Apple: $e');
      rethrow;
    }
  }

  //https://cloud.appwrite.io/auth/oauth2/success?project=64fe0ebe947be358e413&domain=.cloud.appwrite.io&key=a_session_64fe0ebe947be358e413&secret=eyJpZCI6IjY1ZDM5NTYwM2JjYWNmNzA3YzUyIiwic2VjcmV0IjoiMGU5YWVhYmIzMzdhMjFmNDY5ZTcyMGEzZDllODUxMWU2NjlkOTU0NGNkYTM1YzA1ODI4MWE0OTY0N2FhMzkzNWU4ZTdkZDhhNWUyNTdkMjk5ZWQ0NDBmYjM3YjY4ZmE0NGEzM2ZlZjZmZGRlMTBhOTIxY2YwYjdmMjI3Zjg1YWUzODZkOTAwNmNmMjIzNDQ3ZWY1ZmJjNGI0MTIzYTBjOGQ0MjM0MmNhODgwY2JkZWVhMjgzMTBiYjllN2NmY2NlYjM4OTQyYWRlOGYwNGZkY2RhMmJjZjM3YmM1NDk3ZWY3MTEzYmMwYTBmM2FlZDAyYTM2ODBiMzJlYTZhMDE2YiJ9#

  @override
  Future<void> signInWithGoogle() async {
    try {
      await account.createOAuth2Session(provider: 'google');
      debugPrint('session created');
      Session _session = await account.getSession(sessionId: 'current');
      setSession(_session);

      debugPrint('session set');
      await userService.createUser();
      navigationService.navigateToHome();
    } on AppwriteException catch (e) {
      debugPrint('Error signing in with Google: $e');
      throw e.message ?? 'Error signing in with Google';
    } catch (e) {
      debugPrint('Error signing in with Google: $e');
      rethrow;
    }
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
