import 'package:json_annotation/json_annotation.dart';
import 'package:flutterfast/features/shared/utils/json/utils.dart';

part 'fast_user.g.dart';

@JsonSerializable(explicitToJson: true)
class FastUser {
  String id;

  String? email;

  String? username;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  String? phone;

  bool? onboarded;

  @JsonKey(name: 'date_of_birth', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? dateOfBirth;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? createdAt;

  FastUser({
    required this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.createdAt,
    this.onboarded,
    this.phone,
  });

  factory FastUser.fromJson(Map<String, dynamic> json) => _$FastUserFromJson(json);

  Map<String, dynamic> toJson() => _$FastUserToJson(this);
}
