import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/feedback/models/feedback.dart';

class FeedbackViewModelBuilder extends ViewModelBuilder<FeedbackViewModel> {
  const FeedbackViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => FeedbackViewModel();
}

class FeedbackViewModel extends ViewModel<FeedbackViewModel> {
  List<Feedback> allFeedback = [];

  @override
  void initState() {
    setLoading(true);
    feedbackService.getLatestFeedback().then((value) {
      setState(() {
        allFeedback = value;
        setLoading(false);
      });
    });
    super.initState();
  }

  static FeedbackViewModel of_(BuildContext context) => getModel<FeedbackViewModel>(context);
}
