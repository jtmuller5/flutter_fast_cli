import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/feedback/models/feedback.dart';
import 'package:flutterfast/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast/features/feedback/ui/new_feedback/new_feedback_view_model.dart';

@supabase
@LazySingleton(as: FastFeedbackService)
class SupabaseFeedbackService extends FastFeedbackService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    PostgrestResponse response = await _supabase.from('feedback').select('*').order('created_at', ascending: false).limit(10).execute();

    if (response.data == null) return [];
    if (response.data is List) {
      return (response.data as List).map((e) => Feedback.fromJson(e)).toList();
    } else {
      return [Feedback.fromJson(response.data)];
    }
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    return _supabase.from('feedback').insert(Feedback(
          userId: authenticationService.id!,
          createdAt: DateTime.now(),
          message: feedback,
          type: type,
        ).toJson());
  }
}
