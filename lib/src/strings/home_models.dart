String getMessageText(String appName) {

  appName = appName.toLowerCase();
  return '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:$appName/features/home/models/response_status.dart';
import 'package:$appName/features/shared/utils/json/utils.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {

  final String id;

  final String message;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
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

  factory Message.fromJson(Map<String, dynamic> json) => _\$MessageFromJson(json);

  Map<String, dynamic> toJson() => _\$MessageToJson(this);
} 
''';
}

String getResponseStatusText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:$appName/features/shared/utils/json/utils.dart';

part 'response_status.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseStatus {
  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? completeTime;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? startTime;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? updateTime;

  final String? state;

  final String? error;

  ResponseStatus({
    this.completeTime,
    this.startTime,
    this.updateTime,
    this.state,
    this.error,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) => _\$ResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _\$ResponseStatusToJson(this);
}
  ''';
}