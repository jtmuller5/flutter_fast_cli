// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastMessage _$FastMessageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FastMessage',
      json,
      ($checkedConvert) {
        final val = FastMessage(
          id: $checkedConvert('id', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String?),
          senderId: $checkedConvert('sender_id', (v) => v as String?),
          createdAt:
              $checkedConvert('created_at', (v) => getDateTimeFromTimestamp(v)),
        );
        return val;
      },
      fieldKeyMap: const {'senderId': 'sender_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$FastMessageToJson(FastMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('message', instance.message);
  writeNotNull('sender_id', instance.senderId);
  writeNotNull('created_at', getTimestampFromDateTime(instance.createdAt));
  return val;
}
