import 'gpt_choice.dart';
import 'gpt_usage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpt_message.g.dart';

/// {"id":"chatcmpl-6pfNXXH2gdLcoo0pYhfHRFD7XIWZK",
/// "object":"chat.completion",
/// "created":1677771807,
/// "model":"gpt-3.5-turbo-0301",
/// "usage":{"prompt_tokens":12,"completion_tokens":29,"total_tokens":41},
/// "choices":[{"message":{"role":"assistant","content":"\n\n\"Can't decide if I want to be productive today or just binge-watch my favorite show... #decisions #procrastination\""},
/// "finish_reason":"stop","index":0}]}
@JsonSerializable(explicitToJson: true)
class GptMessage {
  String id;

  String object;

  int created;

  String model;

  GptUsage usage;

  List<GptChoice> choices;

  GptMessage({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
  });

  factory GptMessage.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageToJson(this);
}
