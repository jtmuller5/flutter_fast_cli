import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'new_feedback_view_model.dart';

@RoutePage()
class NewFeedbackView extends StatelessWidget {
  const NewFeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewFeedbackViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(title: Text('Feedback')),
          body: Center(
            child: Text('Home')
          ),
        );
      },
    );
  }
}
