String getSignInText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:auto_route/annotations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:$appName/app/router.dart';
import 'package:$appName/app/services.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset('assets/images/logo.png'),
        );
      },
      sideBuilder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24),
            const Text('Template'),
          ],
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }),
        AuthStateChangeAction<UserCreated>((context, state) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        })
      ],
    );
  }
}
''';
}


String getRegisterText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:$appName/app/router.dart';
import 'package:$appName/app/services.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset('assets/images/logo.png'),
        );
      },
      sideBuilder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24),
            const Text('Template'),
          ],
        );
      },
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) async {
          await userService.createUser();
          router.pushAndPopUntil(const OnboardingRoute(), predicate: (route) => false);
        }),
      ],
    );
  }
}
''';
}

String getProfileText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:auto_route/annotations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:$appName/app/router.dart';
import 'package:$appName/app/services.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      showMFATile: false,
      avatar: const SizedBox.shrink(),
      appBar: AppBar(title: const Text('Profile')),
      actions: [
        SignedOutAction((context) {
          router.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        }),
      ],
    );
  }
}
''';
}

String getForgotPasswordText() {
  return '''
import 'package:auto_route/annotations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(email: email);
  }
}
''';
}