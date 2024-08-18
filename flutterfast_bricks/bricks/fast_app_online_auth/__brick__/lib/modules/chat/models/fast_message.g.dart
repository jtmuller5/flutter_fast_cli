// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastMessage _$FastMessageFromJson(Map<String, dynamic> json) => FastMessage(
      id: json['id'] as String?,
      message: json['message'] as String?,
      senderId: json['sender_id'] as String?,
      createdAt: getDateTimeFromTimestamp(json['created_at']),
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
