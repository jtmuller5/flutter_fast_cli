import 'package:json_annotation/json_annotation.dart';
import 'package:template/features/feedback/ui/new_feedback/new_feedback_view_model.dart';
import 'package:template/features/shared/utils/json/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class Feedback {
  final String message;

  final String? id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? createdAt;

  /// bug, feature, other
  final FeedbackType type;

  Feedback({
    required this.message,
    required this.userId,
    required this.id,
    required this.type,
    required this.createdAt,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
