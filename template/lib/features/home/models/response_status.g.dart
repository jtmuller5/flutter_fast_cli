// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) =>
    ResponseStatus(
      completeTime:
          getDateTimeFromTimestamp(json['completeTime'] as Timestamp?),
      startTime: getDateTimeFromTimestamp(json['startTime'] as Timestamp?),
      updateTime: getDateTimeFromTimestamp(json['updateTime'] as Timestamp?),
      state: json['state'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) =>
    <String, dynamic>{
      'completeTime': getTimestampFromDateTime(instance.completeTime),
      'startTime': getTimestampFromDateTime(instance.startTime),
      'updateTime': getTimestampFromDateTime(instance.updateTime),
      'state': instance.state,
      'error': instance.error,
    };
