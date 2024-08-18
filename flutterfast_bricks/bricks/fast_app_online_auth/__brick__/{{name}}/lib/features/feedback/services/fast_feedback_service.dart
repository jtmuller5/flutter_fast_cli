import 'package:{{ name }}/features/feedback/models/feedback.dart';
import 'package:{{ name }}/features/feedback/ui/new_feedback/new_feedback_view.dart';

abstract class FastFeedbackService {
  Future<void> submitFeedback(String feedback, FeedbackType type);

  Future<List<Feedback>> getLatestFeedback();
}
