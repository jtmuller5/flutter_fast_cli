import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:template/features/home/models/response_status.dart';
import 'package:template/features/shared/utils/json/utils.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  final String id;

  final String message;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? createdAt;

  String? response;

  ResponseStatus? status;

  Message({
    required this.id,
    required this.message,
    required this.createdAt,
    this.response,
    this.status,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
