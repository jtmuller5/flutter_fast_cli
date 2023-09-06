// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
      message: json['message'] as String,
      userId: json['user_id'] as String,
      id: json['id'] as String,
      type: $enumDecode(_$FeedbackTypeEnumMap, json['type']),
      createdAt: getDateTimeFromTimestamp(json['created_at'] as Timestamp?),
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': getTimestampFromDateTime(instance.createdAt),
      'type': _$FeedbackTypeEnumMap[instance.type]!,
    };

const _$FeedbackTypeEnumMap = {
  FeedbackType.bug: 'bug',
  FeedbackType.feature: 'feature',
  FeedbackType.other: 'other',
};
