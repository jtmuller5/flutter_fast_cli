// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptMessage _$GptMessageFromJson(Map<String, dynamic> json) => GptMessage(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      usage: GptUsage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => GptChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
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
