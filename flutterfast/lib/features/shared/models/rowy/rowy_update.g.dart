// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rowy_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowyUpdate _$RowyUpdateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'RowyUpdate',
      json,
      ($checkedConvert) {
        final val = RowyUpdate(
          displayName: $checkedConvert('displayName', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          emailVerified: $checkedConvert('emailVerified', (v) => v as bool?),
          isAnonymous: $checkedConvert('isAnonymous', (v) => v as bool?),
          photoURL: $checkedConvert('photoURL', (v) => v as String?),
          timestamp:
              $checkedConvert('timestamp', (v) => getDateTimeFromTimestamp(v)),
          uid: $checkedConvert('uid', (v) => v as String?),
          updateField: $checkedConvert('updateField', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$RowyUpdateToJson(RowyUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('displayName', instance.displayName);
  writeNotNull('email', instance.email);
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('isAnonymous', instance.isAnonymous);
  writeNotNull('photoURL', instance.photoURL);
  writeNotNull('timestamp', getTimestampFromDateTime(instance.timestamp));
  writeNotNull('uid', instance.uid);
  writeNotNull('updateField', instance.updateField);
  return val;
}
