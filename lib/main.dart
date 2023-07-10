import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'injector.dart';
import 'router/router.gr.dart';

void runQuizApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.initialize();
  runApp(const QuizApp());
}

void main() {
  runQuizApp();
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouters();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
        routerDelegate: appRouter.delegate(
          initialRoutes: [const HomePageRoute()],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
