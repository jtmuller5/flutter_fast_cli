// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rowy_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowyUpdate _$RowyUpdateFromJson(Map<String, dynamic> json) => RowyUpdate(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      isAnonymous: json['isAnonymous'] as bool?,
      photoURL: json['photoURL'] as String?,
      timestamp: getDateTimeFromTimestamp(json['timestamp']),
      uid: json['uid'] as String?,
      updateField: json['updateField'] as String?,
    );

Map<String, dynamic> _$RowyUpdateToJson(RowyUpdate instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'photoURL': instance.photoURL,
      'timestamp': getTimestampFromDateTime(instance.timestamp),
      'uid': instance.uid,
      'updateField': instance.updateField,
    };
