import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authenticationService.signInScreen();
  }
}
