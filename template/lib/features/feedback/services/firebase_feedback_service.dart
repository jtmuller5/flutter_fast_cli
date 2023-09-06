import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:template/app/services.dart';
import 'package:template/features/feedback/models/feedback.dart';
import 'package:template/features/feedback/services/fast_feedback_service.dart';
import 'package:template/features/feedback/ui/new_feedback/new_feedback_view_model.dart';
import 'package:template/main.dart';

@firebase
@LazySingleton(as: FastFeedbackService)
class FirebaseFeedbackService extends FastFeedbackService {
  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    DocumentReference feedbackDoc = FirebaseFirestore.instance.collection('feedback').doc();

    await feedbackDoc.set(Feedback(
      id: feedbackDoc.id,
      userId: authenticationService.id!,
      createdAt: DateTime.now(),
      message: feedback,
      type: type,
    ).toJson());
  }

  @override
  Future<List<Feedback>> getLatestFeedback() {
    return FirebaseFirestore.instance.collection('feedback').orderBy('createdAt', descending: true).limit(10).get().then((value) => value.docs.map((e) => Feedback.fromJson(e.data())).toList());
  }
}
