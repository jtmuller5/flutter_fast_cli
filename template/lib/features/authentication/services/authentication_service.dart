import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:template/features/authentication/services/fast_authentication_service.dart';

@Singleton(as: FastAuthenticationService)
class FirebaseAuthenticationService extends FastAuthenticationService {
  @override
  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  String? get id => FirebaseAuth.instance.currentUser?.uid;

  @override
  String? get email => FirebaseAuth.instance.currentUser?.email;
}
