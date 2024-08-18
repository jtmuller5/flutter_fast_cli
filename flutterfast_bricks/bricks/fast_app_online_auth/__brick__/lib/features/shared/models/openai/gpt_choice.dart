import 'gpt_choice_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpt_choice.g.dart';

/// "choices":[{"message":
/// {"role":"assistant",
/// "choices":[{"message":{"role":"assistant","content":"\n\n\"Can't decide if I want to be productive today or just binge-watch my favorite show... #decisions #procrastination\""},
/// "finish_reason":"stop","index":0}]}
@JsonSerializable(explicitToJson: true)
class GptChoice {
  GptChoiceMessage message;

  @JsonKey(name: 'finish_reason')
  String? finishReason;

  int index;

  // Constructor
  GptChoice(
      {required this.message, required this.finishReason, required this.index});

  // Factory
  factory GptChoice.fromJson(Map<String, dynamic> json) =>
      _$GptChoiceFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$GptChoiceToJson(this);
}
