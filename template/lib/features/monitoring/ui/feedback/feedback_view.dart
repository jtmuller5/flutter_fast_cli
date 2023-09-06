import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'feedback_view_model.dart';

@RoutePage()
class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedbackViewModelBuilder(
      builder: (context, model) {
        return const Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        );
      },
    );
  }
}
