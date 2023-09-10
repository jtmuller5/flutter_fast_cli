import 'package:json_annotation/json_annotation.dart';

part 'gpt_usage.g.dart';

/// "usage":{"prompt_tokens":12,"completion_tokens":29,"total_tokens":41},
@JsonSerializable(explicitToJson: true)
class GptUsage {
  @JsonKey(name: 'prompt_tokens')
  int promptTokens;

  @JsonKey(name: 'completion_tokens')
  int completionTokens;

  @JsonKey(name: 'total_tokens')
  int totalTokens;

  GptUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory GptUsage.fromJson(Map<String, dynamic> json) =>
      _$GptUsageFromJson(json);

  Map<String, dynamic> toJson() => _$GptUsageToJson(this);
}
