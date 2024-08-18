import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:{{ name }}/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:injectable/injectable.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/app/services.dart';
import 'package:{{ name }}/features/feedback/models/feedback.dart';
import 'package:{{ name }}/features/feedback/services/fast_feedback_service.dart';

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
    return FirebaseFirestore.instance
        .collection('feedback')
        .orderBy('createdAt', descending: true)
        .limit(10)
        .get()
        .then((value) => value.docs.map((e) => Feedback.fromJson(e.data())).toList());
  }
}
