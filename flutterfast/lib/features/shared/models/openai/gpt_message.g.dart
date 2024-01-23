// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptMessage _$GptMessageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GptMessage',
      json,
      ($checkedConvert) {
        final val = GptMessage(
          id: $checkedConvert('id', (v) => v as String),
          object: $checkedConvert('object', (v) => v as String),
          created: $checkedConvert('created', (v) => v as int),
          model: $checkedConvert('model', (v) => v as String),
          usage: $checkedConvert(
              'usage', (v) => GptUsage.fromJson(v as Map<String, dynamic>)),
          choices: $checkedConvert(
              'choices',
              (v) => (v as List<dynamic>)
                  .map((e) => GptChoice.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$GptMessageToJson(GptMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage.toJson(),
      'choices': instance.choices.map((e) => e.toJson()).toList(),
    };
