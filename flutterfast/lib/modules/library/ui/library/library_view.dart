import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'library_view_model.dart';

@RoutePage()
class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LibraryViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            body: Center(
          child: Text('Home'),
        ));
      },
    );
  }
}
