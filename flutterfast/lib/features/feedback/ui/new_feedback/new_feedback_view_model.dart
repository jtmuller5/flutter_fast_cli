import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';

class NewFeedbackViewModelBuilder extends ViewModelBuilder<NewFeedbackViewModel> {
  const NewFeedbackViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => NewFeedbackViewModel();
}

class NewFeedbackViewModel extends ViewModel<NewFeedbackViewModel> {
  TextEditingController feedbackController = TextEditingController();

  ValueNotifier<FeedbackType?> type = ValueNotifier(null);

  void setType(FeedbackType val) {
    type.value = val;
  }

  Future<void> submitFeedback() async {
    assert(type.value != null, 'Feedback type must be selected');
    assert(feedbackController.text.isNotEmpty, 'Feedback message must not be empty');

    setLoading(true);
    await feedbackService.submitFeedback(feedbackController.text, type.value!);
    setLoading(false);
  }

  static NewFeedbackViewModel of_(BuildContext context) => getModel<NewFeedbackViewModel>(context);
}

enum FeedbackType {
  bug,
  feature,
  other,
}
