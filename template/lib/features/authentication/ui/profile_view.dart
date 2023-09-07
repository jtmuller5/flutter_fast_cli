import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authenticationService.profileScreen();
  }
}
