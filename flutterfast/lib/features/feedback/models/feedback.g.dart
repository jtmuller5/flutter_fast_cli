// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Feedback',
      json,
      ($checkedConvert) {
        final val = Feedback(
          message: $checkedConvert('message', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$FeedbackTypeEnumMap, v)),
          createdAt:
              $checkedConvert('created_at', (v) => getDateTimeFromTimestamp(v)),
          id: $checkedConvert('id', (v) => v as String?),
          userId: $checkedConvert('user_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at', 'userId': 'user_id'},
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
  writeNotNull('user_id', instance.userId);
  writeNotNull('created_at', getTimestampFromDateTime(instance.createdAt));
  val['type'] = _$FeedbackTypeEnumMap[instance.type]!;
  return val;
}

const _$FeedbackTypeEnumMap = {
  FeedbackType.bug: 'bug',
  FeedbackType.feature: 'feature',
  FeedbackType.other: 'other',
};
