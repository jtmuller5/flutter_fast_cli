String getFastAuthenticationServiceText() {
  return '''
import 'package:firebase_auth/firebase_auth.dart';

abstract class FastAuthenticationService {
  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  String? get id => FirebaseAuth.instance.currentUser?.uid;

  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> signOut();
}
''';
}

String getAuthenticationServiceText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:$appName/features/authentication/services/fast_authentication_service.dart';

@Singleton(as: FastAuthenticationService)
class AuthenticationService extends FastAuthenticationService {
  @override
  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  String? get id => FirebaseAuth.instance.currentUser?.uid;

  @override
  String? get email => FirebaseAuth.instance.currentUser?.email;

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
''';
}
