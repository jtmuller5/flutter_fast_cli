import 'package:flutterfast/features/shared/utils/json/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'palm_response_status.g.dart';

@JsonSerializable(explicitToJson: true)
class PalmResponseStatus {
  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? completeTime;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? startTime;

  @JsonKey(fromJson: getDateTimeFromTimestamp, toJson: getTimestampFromDateTime)
  final DateTime? updateTime;

  /// COMPLETED, PROCESSING, ERRORED
  final String? state;

  final String? error;

  PalmResponseStatus({
    this.completeTime,
    this.startTime,
    this.updateTime,
    this.state,
    this.error,
  });

  factory PalmResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$PalmResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$PalmResponseStatusToJson(this);
}
