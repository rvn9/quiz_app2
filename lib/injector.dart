import 'package:get_it/get_it.dart';
import 'package:quiz_app2/data/remote/base_service.dart';
import 'package:quiz_app2/repositories/question_repository.dart';

import 'data/remote/question_service.dart';

final getIt = GetIt.instance;

class Injector {
  const Injector();

  static Future<void> initialize() async {
    const injector = Injector();
    injector._initializeService();
    injector._initializeRepository();
  }

  void _initializeService() {
    getIt.registerLazySingleton<BaseService>(() => BaseService.create());
    getIt
        .registerLazySingleton<QuestionService>(() => QuestionService.create());
  }

  void _initializeRepository() {
    getIt.registerLazySingleton<QuestionRepository>(
        () => QuestionRepository.create());
  }
}
