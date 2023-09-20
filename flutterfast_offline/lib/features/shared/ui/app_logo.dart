import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.sideLength = 100}) : super(key: key);

  final double sideLength;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: sideLength,
    );
  }
}
