import 'package:json_annotation/json_annotation.dart';

part 'palm_safety_metadata.g.dart';

@JsonSerializable(explicitToJson: true)
class PalmSafetyMetadata {
  final bool blocked;

  List<PalmSafetyFeedback> safetyFeedback;

  PalmSafetyMetadata({
    required this.blocked,
    required this.safetyFeedback,
  });

  factory PalmSafetyMetadata.fromJson(Map<String, dynamic> json) => _$PalmSafetyMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PalmSafetyMetadataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PalmSafetyFeedback {
  final PalmSafetyRating rating;

  final PalmSafetySetting setting;

  PalmSafetyFeedback({
    required this.rating,
    required this.setting,
  });

  factory PalmSafetyFeedback.fromJson(Map<String, dynamic> json) => _$PalmSafetyFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$PalmSafetyFeedbackToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PalmSafetyRating {
  final String category;

  final String probability;

  PalmSafetyRating({
    required this.category,
    required this.probability,
  });

  factory PalmSafetyRating.fromJson(Map<String, dynamic> json) => _$PalmSafetyRatingFromJson(json);

  Map<String, dynamic> toJson() => _$PalmSafetyRatingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PalmSafetySetting {
  final String category;

  final String threshold;

  PalmSafetySetting({
    required this.category,
    required this.threshold,
  });

  factory PalmSafetySetting.fromJson(Map<String, dynamic> json) => _$PalmSafetySettingFromJson(json);

  Map<String, dynamic> toJson() => _$PalmSafetySettingToJson(this);
}
