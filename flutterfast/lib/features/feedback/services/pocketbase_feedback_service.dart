import 'package:flutterfast/features/feedback/models/feedback.dart';
import 'package:flutterfast/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast/features/feedback/ui/new_feedback/new_feedback_view.dart';

class PocketBaseFeedbackService extends FastFeedbackService {
  @override
  Future<List<Feedback>> getLatestFeedback() {
    // TODO: implement getLatestFeedback
    throw UnimplementedError();
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) {
    // TODO: implement submitFeedback
    throw UnimplementedError();
  }

}