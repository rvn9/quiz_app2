import 'package:dartz/dartz.dart';

import 'package:quiz_app2/data/remote/question_service.dart';
import 'package:quiz_app2/model/payload.dart';

import '../injector.dart';

class QuestionRepository {
  final QuestionService _questionService;

  QuestionRepository(this._questionService);

  factory QuestionRepository.create() => QuestionRepository(getIt.get());

  Future<Either<Exception, Payload>> getQuestions() async {
    try {
      final result = await _questionService.getQuestions();
      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }

  Future<Either<Exception, bool>> saveAnswer(Payload payload) async {
    try {
      final result = await _questionService.saveAnswer(payload);
      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }
}
