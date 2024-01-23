// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_choice_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChoiceMessage _$GptChoiceMessageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GptChoiceMessage',
      json,
      ($checkedConvert) {
        final val = GptChoiceMessage(
          role: $checkedConvert('role', (v) => v as String),
          content: $checkedConvert('content', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$GptChoiceMessageToJson(GptChoiceMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
