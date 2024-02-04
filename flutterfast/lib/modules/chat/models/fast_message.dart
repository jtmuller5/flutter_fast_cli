import 'package:flutterfast/features/shared/utils/json/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fast_message.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class FastMessage {
  String? id;

  String? message;

  @JsonKey(name: 'sender_id')
  String? senderId;

  @JsonKey(name: 'created_at', fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  DateTime? createdAt;

  FastMessage({
    this.id,
    this.message,
    this.senderId,
    this.createdAt,
  });

  factory FastMessage.fromJson(Map<String, dynamic> json) => _$FastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$FastMessageToJson(this);
}
