import 'package:auto_route/auto_route.dart';
import 'package:quiz_app2/pages/question_page.dart';
import 'package:quiz_app2/pages/result_page.dart';

import '../pages/home_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  HomePage.route,
  QuestionPage.route,
  ResultPage.route,
])
class $AppRouters {}
