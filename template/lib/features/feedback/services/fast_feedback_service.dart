import 'package:template/features/feedback/models/feedback.dart';
import 'package:template/features/feedback/ui/new_feedback/new_feedback_view_model.dart';

abstract class FastFeedbackService {
  Future<void> submitFeedback(String feedback, FeedbackType type);

  Future<List<Feedback>> getLatestFeedback();
}