// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastUser _$FastUserFromJson(Map<String, dynamic> json) => FastUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth: getDateTimeFromTimestamp(json['date_of_birth']),
      createdAt: getDateTimeFromTimestamp(json['created_at']),
    );

Map<String, dynamic> _$FastUserToJson(FastUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': getTimestampFromDateTime(instance.dateOfBirth),
      'created_at': getTimestampFromDateTime(instance.createdAt),
    };
