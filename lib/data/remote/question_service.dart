import 'dart:convert';

import '../../endpoints.dart';
import '../../injector.dart';
import '../../model/payload.dart';
import 'base_service.dart';

class QuestionService extends Endpoint {
  final BaseService _baseService;

  QuestionService(this._baseService);

  factory QuestionService.create() =>
      QuestionService(getIt.get())..getQuestions();

  Future<Payload> getQuestions() async {
    final url = endpointBaseUrlWithVersion(path: "check-mental-health");
    final response = await _baseService.dio.get(url);
    final result = Payload.fromJson(jsonDecode(response.data));
    return result;
  }

  Future<bool> saveAnswer(Payload payload) async {
    final url = endpointBaseUrlWithVersion(path: "mental-health/save");
    final response = await _baseService.dio.post(url, data: payload.toJson());
    if (response.statusCode == 200) return true;
    return false;
  }
}
