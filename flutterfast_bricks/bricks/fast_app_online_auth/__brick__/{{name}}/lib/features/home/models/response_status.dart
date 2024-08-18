import 'package:json_annotation/json_annotation.dart';
import 'package:{{ name }}/features/shared/utils/json/utils.dart';

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

  factory ResponseStatus.fromJson(Map<String, dynamic> json) => _$ResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}
