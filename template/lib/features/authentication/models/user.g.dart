// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth:
          getDateTimeFromTimestamp(json['date_of_birth'] as Timestamp?),
      createdAt: getDateTimeFromTimestamp(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': getTimestampFromDateTime(instance.dateOfBirth),
      'createdAt': getTimestampFromDateTime(instance.createdAt),
    };
