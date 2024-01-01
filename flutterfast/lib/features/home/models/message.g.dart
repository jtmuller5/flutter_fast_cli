// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      message: json['message'] as String,
      createdAt: getDateTimeFromTimestamp(json['created_at']),
      response: json['response'] as String?,
      status: json['status'] == null
          ? null
          : ResponseStatus.fromJson(json['status'] as Map<String, dynamic>),
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
