// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Message',
      json,
      ($checkedConvert) {
        final val = Message(
          id: $checkedConvert('id', (v) => v as String),
          message: $checkedConvert('message', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => getDateTimeFromTimestamp(v)),
          response: $checkedConvert('response', (v) => v as String?),
          status: $checkedConvert(
              'status',
              (v) => v == null
                  ? null
                  : ResponseStatus.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_at', getTimestampFromDateTime(instance.createdAt));
  writeNotNull('response', instance.response);
  writeNotNull('status', instance.status?.toJson());
  return val;
}
