import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/app/services.dart';
import 'package:flutterfast_online_auth/features/feedback/models/feedback.dart';
import 'package:flutterfast_online_auth/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast_online_auth/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastFeedbackService)
class AppwriteFeedbackService extends FastFeedbackService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

  Databases get databases => Databases(client);

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    try {
      DocumentList feedback = await databases.listDocuments(
        databaseId: const String.fromEnvironment('APPWRITE_DATABASE_ID'),
        collectionId: 'feedback',
      );

      if (feedback.documents.isEmpty) return [];

      return feedback.documents.map((e) => Feedback.fromJson(e.data)).toList();
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      debugPrint(e.code.toString());
      debugPrint(e.type);
      return [];
    } catch (e) {
      debugPrint('Appwrite error: $e');
      return [];
    }
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    assert(authenticationService.id != null, 'User must be logged in to submit feedback');
    try {
      String id = ID.unique();
      await databases.createDocument(
          databaseId: const String.fromEnvironment('APPWRITE_DATABASE_ID'),
          collectionId: 'feedback',
          documentId: id,
          data: Feedback(
            userId: authenticationService.id!,
            createdAt: DateTime.now(),
            message: feedback,
            type: type,
          ).toJson());
    } catch (e) {
      debugPrint('Appwrite error: $e');
    }
  }
}
