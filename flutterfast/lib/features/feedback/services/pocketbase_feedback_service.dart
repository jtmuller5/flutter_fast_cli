import 'package:flutter/foundation.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/feedback/models/feedback.dart';
import 'package:flutterfast/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@pocketbase
@LazySingleton(as: FastFeedbackService)
class PocketBaseFeedbackService extends FastFeedbackService {
  PocketBase pb = PocketBase(const String.fromEnvironment('POCKETBASE_URL'));

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    debugPrint('getLatestFeedback');
    ResultList<RecordModel> results = await pb.collection('feedback').getList();
    debugPrint('results: ' + results.toString());

    return results.items.map((e) => Feedback.fromJson(e.toJson())).toList();
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    try {
      Feedback newFeedback = Feedback(
        userId: authenticationService.id!,
        message: feedback,
        type: type,
        createdAt: DateTime.now(),
      );
      await pb.collection('feedback').create(body: newFeedback.toJson());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
