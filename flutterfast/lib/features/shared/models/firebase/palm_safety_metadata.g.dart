// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_safety_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalmSafetyMetadata _$PalmSafetyMetadataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PalmSafetyMetadata',
      json,
      ($checkedConvert) {
        final val = PalmSafetyMetadata(
          blocked: $checkedConvert('blocked', (v) => v as bool),
          safetyFeedback: $checkedConvert(
              'safetyFeedback',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PalmSafetyFeedback.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PalmSafetyMetadataToJson(PalmSafetyMetadata instance) =>
    <String, dynamic>{
      'blocked': instance.blocked,
      'safetyFeedback': instance.safetyFeedback.map((e) => e.toJson()).toList(),
    };

PalmSafetyFeedback _$PalmSafetyFeedbackFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PalmSafetyFeedback',
      json,
      ($checkedConvert) {
        final val = PalmSafetyFeedback(
          rating: $checkedConvert('rating',
              (v) => PalmSafetyRating.fromJson(v as Map<String, dynamic>)),
          setting: $checkedConvert('setting',
              (v) => PalmSafetySetting.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PalmSafetyFeedbackToJson(PalmSafetyFeedback instance) =>
    <String, dynamic>{
      'rating': instance.rating.toJson(),
      'setting': instance.setting.toJson(),
    };

PalmSafetyRating _$PalmSafetyRatingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PalmSafetyRating',
      json,
      ($checkedConvert) {
        final val = PalmSafetyRating(
          category: $checkedConvert('category', (v) => v as String),
          probability: $checkedConvert('probability', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PalmSafetyRatingToJson(PalmSafetyRating instance) =>
    <String, dynamic>{
      'category': instance.category,
      'probability': instance.probability,
    };

PalmSafetySetting _$PalmSafetySettingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PalmSafetySetting',
      json,
      ($checkedConvert) {
        final val = PalmSafetySetting(
          category: $checkedConvert('category', (v) => v as String),
          threshold: $checkedConvert('threshold', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PalmSafetySettingToJson(PalmSafetySetting instance) =>
    <String, dynamic>{
      'category': instance.category,
      'threshold': instance.threshold,
    };
