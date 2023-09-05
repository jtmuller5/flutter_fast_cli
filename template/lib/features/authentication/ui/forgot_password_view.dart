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
