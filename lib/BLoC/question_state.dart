part of './question_cubit.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState.initial() = _QuestionStateInitial;
  const factory QuestionState.loading() = _QuestionStateLoading;
  const factory QuestionState.success(Payload payload) = _QuestionStateuccess;
  const factory QuestionState.isSaved(bool isSaved) = _QuestionStateIsSaved;
  const factory QuestionState.error(Exception error) = _QuestionStateError;
}
