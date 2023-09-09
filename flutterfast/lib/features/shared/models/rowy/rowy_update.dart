import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfast/features/shared/utils/json/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rowy_update.g.dart';

@JsonSerializable(explicitToJson: true)
class RowyUpdate {
  String? displayName;

  String? email;

  bool? emailVerified;

  bool? isAnonymous;

  String? photoURL;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? timestamp;

  String? uid;

  String? updateField;

  RowyUpdate({
    this.displayName,
    this.email,
    this.emailVerified,
    this.isAnonymous,
    this.photoURL,
    this.timestamp,
    this.uid,
    this.updateField,
  });

  factory RowyUpdate.fromJson(Map<String, dynamic> json) => _$RowyUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$RowyUpdateToJson(this);
}
