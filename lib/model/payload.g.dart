// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payload _$$_PayloadFromJson(Map<String, dynamic> json) => _$_Payload(
      fullName: json['fullName'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      anxietyScore: json['anxietyScore'] as int,
      depressionScore: json['depressionScore'] as int,
    );

Map<String, dynamic> _$$_PayloadToJson(_$_Payload instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'questions': instance.questions,
      'options': instance.options,
      'anxietyScore': instance.anxietyScore,
      'depressionScore': instance.depressionScore,
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      text: json['text'] as String,
      category: json['category'] as String,
      answer: json['answer'] as int,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'text': instance.text,
      'category': instance.category,
      'answer': instance.answer,
    };

_$_Option _$$_OptionFromJson(Map<String, dynamic> json) => _$_Option(
      text: json['text'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$$_OptionToJson(_$_Option instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
