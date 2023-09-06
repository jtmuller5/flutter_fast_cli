import 'package:injectable/injectable.dart';
import 'package:template/features/feedback/services/fast_feedback_service.dart';

@LazySingleton(as: FastFeedbackService)
class FirebaseFeedbackService extends FastFeedbackService {
  @override
  Future<void> submitFeedback(String feedback) async {

  }
}