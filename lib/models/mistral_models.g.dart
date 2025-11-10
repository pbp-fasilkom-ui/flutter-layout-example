// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mistral_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) =>
    Message(role: json['role'] as String, content: json['content'] as String);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'role': instance.role,
  'content': instance.content,
};

MistralChatRequest _$MistralChatRequestFromJson(Map<String, dynamic> json) =>
    MistralChatRequest(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['top_p'] as num?)?.toDouble(),
      maxTokens: (json['max_tokens'] as num?)?.toInt(),
      stream: json['stream'] as bool?,
      safePrompt: json['safe_prompt'] as bool?,
      randomSeed: (json['random_seed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MistralChatRequestToJson(MistralChatRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'temperature': ?instance.temperature,
      'top_p': ?instance.topP,
      'max_tokens': ?instance.maxTokens,
      'stream': ?instance.stream,
      'safe_prompt': ?instance.safePrompt,
      'random_seed': ?instance.randomSeed,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
  promptTokens: (json['prompt_tokens'] as num).toInt(),
  completionTokens: (json['completion_tokens'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
);

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
  'prompt_tokens': instance.promptTokens,
  'completion_tokens': instance.completionTokens,
  'total_tokens': instance.totalTokens,
};

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
  index: (json['index'] as num).toInt(),
  message: Message.fromJson(json['message'] as Map<String, dynamic>),
  finishReason: json['finish_reason'] as String,
);

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
  'index': instance.index,
  'message': instance.message.toJson(),
  'finish_reason': instance.finishReason,
};

MistralChatResponse _$MistralChatResponseFromJson(Map<String, dynamic> json) =>
    MistralChatResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MistralChatResponseToJson(
  MistralChatResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'created': instance.created,
  'model': instance.model,
  'choices': instance.choices.map((e) => e.toJson()).toList(),
  'usage': instance.usage.toJson(),
};
