import 'package:flutterfast_online_auth/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutterfast_online_auth/features/shared/utils/json/utils.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Feedback {
  String? id;

  final String message;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? createdAt;

  /// bug, feature, other
  final FeedbackType type;

  Feedback({
    required this.message,
    required this.type,
    required this.createdAt,
    this.id,
    this.userId,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
