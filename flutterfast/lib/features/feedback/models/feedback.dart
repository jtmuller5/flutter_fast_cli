import 'package:json_annotation/json_annotation.dart';
import 'package:flutterfast/features/feedback/ui/new_feedback/new_feedback_view_model.dart';
import 'package:flutterfast/features/shared/utils/json/utils.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class Feedback {

  String? id;

  final String message;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? createdAt;

  /// bug, feature, other
  final FeedbackType type;

  Feedback({
    required this.message,
    required this.userId,
    required this.type,
    required this.createdAt,
    this.id,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
