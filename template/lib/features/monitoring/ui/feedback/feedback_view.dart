      import 'package:code_on_the_rocks/code_on_the_rocks.dart';
      import 'package:flutter/material.dart';
      import 'feedback_view_model.dart';
      
      class FeedbackView extends StatelessWidget {
        const FeedbackView({Key? key}) : super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return FeedbackViewModelBuilder(
              builder: (context, model) {
                return Scaffold(
                  body: Center(
                    child: Text('Home'),
                  )
                );
              },
            );
        }
      }
      