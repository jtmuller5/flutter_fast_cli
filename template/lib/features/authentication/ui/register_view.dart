import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';

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
