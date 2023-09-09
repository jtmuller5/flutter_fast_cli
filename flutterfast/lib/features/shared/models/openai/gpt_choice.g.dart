// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChoice _$GptChoiceFromJson(Map<String, dynamic> json) => GptChoice(
      message:
          GptChoiceMessage.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String?,
      index: json['index'] as int,
    );

Map<String, dynamic> _$GptChoiceToJson(GptChoice instance) => <String, dynamic>{
      'message': instance.message.toJson(),
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };
