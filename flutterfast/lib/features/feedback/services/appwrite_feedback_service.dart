import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/feedback/models/feedback.dart';
import 'package:flutterfast/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast/features/feedback/ui/new_feedback/new_feedback_view_model.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastFeedbackService)
class AppwriteFeedbackService extends FastFeedbackService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

  Databases get databases => Databases(client);

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    DocumentList feedback = await databases.listDocuments(databaseId: 'general', collectionId: 'feedback');

    if (feedback.documents.isEmpty) return [];

    return feedback.documents.map((e) => Feedback.fromJson(e.data)).toList();
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    await databases.createDocument(
        databaseId: 'general',
        collectionId: 'feedback',
        documentId: ID.unique(),
        data: Feedback(
          userId: authenticationService.id!,
          createdAt: DateTime.now(),
          message: feedback,
          type: type,
        ).toJson());
  }
}
