import 'package:json_annotation/json_annotation.dart';

part 'mistral_models.g.dart';

@JsonSerializable()
class Message {

  Message({required this.role, required this.content});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  final String role;
  final String content;

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable(
    includeIfNull: false,
    fieldRename: FieldRename.snake,
    explicitToJson: true)
class MistralChatRequest {

  MistralChatRequest({
    required this.model,
    required this.messages,
    this.temperature,
    this.topP,
    this.maxTokens,
    this.stream,
    this.safePrompt,
    this.randomSeed,
  });
  final String model;
  final List<Message> messages;
  final double? temperature;
  final double? topP;
  final int? maxTokens;
  final bool? stream;
  final bool? safePrompt;
  final int? randomSeed;

  Map<String, dynamic> toJson() => _$MistralChatRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Usage {

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Choice {

  Choice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  final int index;
  final Message message;
  final String finishReason;
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);

}

@JsonSerializable(explicitToJson: true)
class MistralChatResponse {

  MistralChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory MistralChatResponse.fromJson(Map<String, dynamic> json) =>
      _$MistralChatResponseFromJson(json);
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
}
