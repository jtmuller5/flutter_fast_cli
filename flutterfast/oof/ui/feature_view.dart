import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'feature_view_model.dart';

@RoutePage()
class OofView extends StatelessWidget {
  const OofView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OofViewModelBuilder(
        builder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Center(
              child: Text('Home'),
            )
          );
        },
      );
  }
}
      