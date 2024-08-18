// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_choice_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChoiceMessage _$GptChoiceMessageFromJson(Map<String, dynamic> json) =>
    GptChoiceMessage(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$GptChoiceMessageToJson(GptChoiceMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
