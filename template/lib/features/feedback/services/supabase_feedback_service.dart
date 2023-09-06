import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/app/services.dart';
import 'package:template/features/feedback/models/feedback.dart';
import 'package:template/features/feedback/services/fast_feedback_service.dart';
import 'package:template/features/feedback/ui/new_feedback/new_feedback_view_model.dart';
import 'package:template/main.dart';

@supabase
@LazySingleton(as: FastFeedbackService)
class SupabaseFeedbackService extends FastFeedbackService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<List<Feedback>> getLatestFeedback() {
    return _supabase.from('feedback').select().order('createdAt', ascending: false).limit(10).then((value) => value.data.map((e) => Feedback.fromJson(e)).toList());
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) {
    return _supabase.from('feedback').insert(Feedback(
          userId: authenticationService.id!,
          createdAt: DateTime.now(),
          message: feedback,
          type: type,
          id: '',
        ).toJson());
  }
}
