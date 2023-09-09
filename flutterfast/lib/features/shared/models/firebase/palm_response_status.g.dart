// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_response_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalmResponseStatus _$PalmResponseStatusFromJson(Map<String, dynamic> json) =>
    PalmResponseStatus(
      completeTime: getDateTimeFromTimestamp(json['completeTime']),
      startTime: getDateTimeFromTimestamp(json['startTime']),
      updateTime: getDateTimeFromTimestamp(json['updateTime']),
      state: json['state'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$PalmResponseStatusToJson(PalmResponseStatus instance) =>
    <String, dynamic>{
      'completeTime': getTimestampFromDateTime(instance.completeTime),
      'startTime': getTimestampFromDateTime(instance.startTime),
      'updateTime': getTimestampFromDateTime(instance.updateTime),
      'state': instance.state,
      'error': instance.error,
    };
