import 'package:json_annotation/json_annotation.dart';

part 'gpt_choice_message.g.dart';

/// {"message":{
/// "role":"assistant",
/// "content":"\n\n\"Can't decide if I want to be productive today or just binge-watch my favorite show... #decisions "#procrastination\""},
/// "finish_reason":"stop","index":0}
@JsonSerializable(explicitToJson: true)
class GptChoiceMessage {
  String role;

  String content;

  // Stripped content
  String get strippedContent =>
      content.replaceAll('\n', '').replaceAll('"', '');

  // Constructor
  GptChoiceMessage({
    required this.role,
    required this.content,
  });

  // Factory
  factory GptChoiceMessage.fromJson(Map<String, dynamic> json) =>
      _$GptChoiceMessageFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$GptChoiceMessageToJson(this);
}
