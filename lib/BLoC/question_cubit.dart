import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../injector.dart';
import '../model/payload.dart';
import '../repositories/question_repository.dart';

part 'question_cubit.freezed.dart';
part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionRepository _questionRepository;
  QuestionCubit(this._questionRepository)
      : super(const QuestionState.initial());
  late Payload payload;
  final questions = <Question>[];
  int _anxietyScore = 0;
  int _depressionScore = 0;

  factory QuestionCubit.create() => QuestionCubit(getIt.get());

  int get anxietyScore => _anxietyScore ~/ 3;
  int get depressionScore => _depressionScore ~/ 3;

  Future<void> getQuestions() async {
    emit(const QuestionState.loading());
    final result = await _questionRepository.getQuestions();
    result.fold(
      (l) => emit(QuestionState.error(l)),
      (r) {
        payload = r;
        questions.addAll(r.questions);
        emit(QuestionState.success(r));
      },
    );
  }

  void calculate() async {
    for (final question in questions) {
      if (question.category == "Kecemasan") {
        _anxietyScore += question.answer;
      } else if (question.category == "Depresi") {
        _depressionScore += question.answer;
      }
    }
  }

  void setAnswer(int userAnswer, int index) {
    final payload = questions[index].copyWith(answer: userAnswer);
    questions[index] = payload;
  }

  Future<void> save(String name) async {
    emit(const QuestionState.loading());
    final newPayload = payload.copyWith(
      anxietyScore: anxietyScore,
      depressionScore: depressionScore,
      questions: questions,
      fullName: name,
    );
    final result = await _questionRepository.saveAnswer(newPayload);
    result.fold(
      (l) => emit(QuestionState.error(l)),
      (r) => emit(QuestionState.isSaved(r)),
    );
  }
}
