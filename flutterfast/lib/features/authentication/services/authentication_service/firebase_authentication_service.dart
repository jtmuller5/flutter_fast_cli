import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:flutterfast/firebase_options.dart';

@firebase
@Singleton(as: FastAuthenticationService)
class FirebaseAuthenticationService extends FastAuthenticationService {
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

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }
}
