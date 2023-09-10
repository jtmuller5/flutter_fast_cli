import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/constants.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/text_theme.dart';
import 'package:flutterfast/features/shared/ui/loading_overlay.dart';
import 'new_feedback_view_model.dart';

@RoutePage()
class NewFeedbackView extends StatelessWidget {
  const NewFeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewFeedbackViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(title: const Text('Submit Feedback')),
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text('What type of feedback do you have?'),
                  gap12,
                  ValueListenableBuilder(
                      valueListenable: model.type,
                      builder: (context, value, child) {
                        return LayoutBuilder(builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (FeedbackType type in FeedbackType.values)
                                SizedBox(
                                  width: (constraints.maxWidth / 3) - 8,
                                  child: FilterChip(
                                    selected: value == type,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(type.name.toUpperCase()),
                                      ],
                                    ),
                                    onSelected: (value) {
                                      model.setType(type);
                                    },
                                  ),
                                ),
                            ],
                          );
                        });
                      }),
                  gap16,
                  TextField(
                    controller: model.feedbackController,
                    maxLines: null,
                    decoration: const InputDecoration(
                        labelText: 'Feedback', border: OutlineInputBorder()),
                  ),
                  gap16,
                  ElevatedButton(
                      onPressed: () async {
                        if (model.feedbackController.text.trim().isEmpty ||
                            model.type.value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please fill out all fields.')));
                        } else {
                          FocusScope.of(context).unfocus();
                          await model.submitFeedback().then((value) {
                            router.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Feedback submitted!')));
                          });
                        }
                      },
                      child: Text(
                        'Submit',
                        style: context.titleLarge.onPrimary.bold,
                      ))
                ],
              ),
              if (model.isLoading)
                const Positioned.fill(child: LoadingOverlay()),
            ],
          ),
        );
      },
    );
  }
}
