// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChoice _$GptChoiceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GptChoice',
      json,
      ($checkedConvert) {
        final val = GptChoice(
          message: $checkedConvert('message',
              (v) => GptChoiceMessage.fromJson(v as Map<String, dynamic>)),
          finishReason: $checkedConvert('finish_reason', (v) => v as String?),
          index: $checkedConvert('index', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {'finishReason': 'finish_reason'},
    );

Map<String, dynamic> _$GptChoiceToJson(GptChoice instance) {
  final val = <String, dynamic>{
    'message': instance.message.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('finish_reason', instance.finishReason);
  val['index'] = instance.index;
  return val;
}
