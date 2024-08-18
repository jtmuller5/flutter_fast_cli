import 'package:{{ name }}/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/app/services.dart';
import 'package:{{ name }}/features/feedback/models/feedback.dart';
import 'package:{{ name }}/features/feedback/services/fast_feedback_service.dart';

@supabase
@LazySingleton(as: FastFeedbackService)
class SupabaseFeedbackService extends FastFeedbackService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    List<Map<String, dynamic>> response = await _supabase.from('feedback').select('*').order('created_at', ascending: false).limit(10);

    if (response.isEmpty) return [];
    return (response).map((e) => Feedback.fromJson(e)).toList();
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
