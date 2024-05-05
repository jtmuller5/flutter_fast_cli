// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptUsage _$GptUsageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GptUsage',
      json,
      ($checkedConvert) {
        final val = GptUsage(
          promptTokens:
              $checkedConvert('prompt_tokens', (v) => (v as num).toInt()),
          completionTokens:
              $checkedConvert('completion_tokens', (v) => (v as num).toInt()),
          totalTokens:
              $checkedConvert('total_tokens', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'promptTokens': 'prompt_tokens',
        'completionTokens': 'completion_tokens',
        'totalTokens': 'total_tokens'
      },
    );

Map<String, dynamic> _$GptUsageToJson(GptUsage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
