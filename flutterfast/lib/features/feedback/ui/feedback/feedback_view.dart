import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/features/feedback/models/feedback.dart';
import 'feedback_view_model.dart';

@RoutePage()
class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedbackViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(title: const Text('Feedback')),
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: model.allFeedback.length,
                  itemBuilder: (BuildContext context, int index) {
                    Feedback feedback = model.allFeedback[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feedback.message,
                              style: context.bodyLarge,
                            ),
                            gap8,
                            Text(
                              MaterialLocalizations.of(context)
                                  .formatFullDate(feedback.createdAt!)
                                  .toString(),
                              style: context.bodySmall,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
