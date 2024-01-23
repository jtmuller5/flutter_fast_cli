// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResponseStatus',
      json,
      ($checkedConvert) {
        final val = ResponseStatus(
          completeTime: $checkedConvert(
              'completeTime', (v) => getDateTimeFromTimestamp(v)),
          startTime:
              $checkedConvert('startTime', (v) => getDateTimeFromTimestamp(v)),
          updateTime:
              $checkedConvert('updateTime', (v) => getDateTimeFromTimestamp(v)),
          state: $checkedConvert('state', (v) => v as String?),
          error: $checkedConvert('error', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('completeTime', getTimestampFromDateTime(instance.completeTime));
  writeNotNull('startTime', getTimestampFromDateTime(instance.startTime));
  writeNotNull('updateTime', getTimestampFromDateTime(instance.updateTime));
  writeNotNull('state', instance.state);
  writeNotNull('error', instance.error);
  return val;
}
