import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';

@RoutePage()
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return authenticationService.forgotPasswordScreen(email);
  }
}
