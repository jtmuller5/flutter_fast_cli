// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastUser _$FastUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FastUser',
      json,
      ($checkedConvert) {
        final val = FastUser(
          id: $checkedConvert('id', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          username: $checkedConvert('username', (v) => v as String?),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          dateOfBirth: $checkedConvert(
              'date_of_birth', (v) => getDateTimeFromTimestamp(v)),
          createdAt:
              $checkedConvert('created_at', (v) => getDateTimeFromTimestamp(v)),
          onboarded: $checkedConvert('onboarded', (v) => v as bool?),
          phone: $checkedConvert('phone', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'dateOfBirth': 'date_of_birth',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$FastUserToJson(FastUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('phone', instance.phone);
  writeNotNull('onboarded', instance.onboarded);
  writeNotNull('date_of_birth', getTimestampFromDateTime(instance.dateOfBirth));
  writeNotNull('created_at', getTimestampFromDateTime(instance.createdAt));
  return val;
}
