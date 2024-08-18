// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_safety_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalmSafetyMetadata _$PalmSafetyMetadataFromJson(Map<String, dynamic> json) =>
    PalmSafetyMetadata(
      blocked: json['blocked'] as bool,
      safetyFeedback: (json['safetyFeedback'] as List<dynamic>)
          .map((e) => PalmSafetyFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PalmSafetyMetadataToJson(PalmSafetyMetadata instance) =>
    <String, dynamic>{
      'blocked': instance.blocked,
      'safetyFeedback': instance.safetyFeedback.map((e) => e.toJson()).toList(),
    };

PalmSafetyFeedback _$PalmSafetyFeedbackFromJson(Map<String, dynamic> json) =>
    PalmSafetyFeedback(
      rating: PalmSafetyRating.fromJson(json['rating'] as Map<String, dynamic>),
      setting:
          PalmSafetySetting.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PalmSafetyFeedbackToJson(PalmSafetyFeedback instance) =>
    <String, dynamic>{
      'rating': instance.rating.toJson(),
      'setting': instance.setting.toJson(),
    };

PalmSafetyRating _$PalmSafetyRatingFromJson(Map<String, dynamic> json) =>
    PalmSafetyRating(
      category: json['category'] as String,
      probability: json['probability'] as String,
    );

Map<String, dynamic> _$PalmSafetyRatingToJson(PalmSafetyRating instance) =>
    <String, dynamic>{
      'category': instance.category,
      'probability': instance.probability,
    };

PalmSafetySetting _$PalmSafetySettingFromJson(Map<String, dynamic> json) =>
    PalmSafetySetting(
      category: json['category'] as String,
      threshold: json['threshold'] as String,
    );

Map<String, dynamic> _$PalmSafetySettingToJson(PalmSafetySetting instance) =>
    <String, dynamic>{
      'category': instance.category,
      'threshold': instance.threshold,
    };
