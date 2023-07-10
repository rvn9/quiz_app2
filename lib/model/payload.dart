import 'package:freezed_annotation/freezed_annotation.dart';

part 'payload.freezed.dart';
part 'payload.g.dart';

@freezed
class Payload with _$Payload {
  factory Payload({
    required String fullName,
    required List<Question> questions,
    required List<Option> options,
    required int anxietyScore,
    required int depressionScore,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}

@freezed
class Question with _$Question {
  factory Question({
    required String text,
    required String category,
    required int answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Option with _$Option {
  factory Option({
    required String text,
    required int value,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
