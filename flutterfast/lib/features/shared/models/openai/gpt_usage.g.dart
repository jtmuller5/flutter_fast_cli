// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptUsage _$GptUsageFromJson(Map<String, dynamic> json) => GptUsage(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$GptUsageToJson(GptUsage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
