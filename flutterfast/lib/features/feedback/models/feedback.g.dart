// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
      message: json['message'] as String,
      userId: json['user_id'] as String,
      type: $enumDecode(_$FeedbackTypeEnumMap, json['type']),
      createdAt: getDateTimeFromTimestamp(json['created_at']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['message'] = instance.message;
  val['user_id'] = instance.userId;
  writeNotNull('created_at', getTimestampFromDateTime(instance.createdAt));
  val['type'] = _$FeedbackTypeEnumMap[instance.type]!;
  return val;
}

const _$FeedbackTypeEnumMap = {
  FeedbackType.bug: 'bug',
  FeedbackType.feature: 'feature',
  FeedbackType.other: 'other',
};
