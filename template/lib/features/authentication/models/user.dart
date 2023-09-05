import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:template/features/shared/utils/json/utils.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String id;

  String? email;

  String? username;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  @JsonKey(name: 'date_of_birth', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? dateOfBirth;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? createdAt;

  User({
    required this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
