import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = Breakpoints.sm;
        if (constraints.maxWidth > maxWidth) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
