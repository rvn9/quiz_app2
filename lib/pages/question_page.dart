import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app2/BLoC/question_cubit.dart';
import 'package:quiz_app2/pages/result_page.dart';
import 'package:quiz_app2/router/router.gr.dart';

class QuestionPage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: QuestionPage,
    path: 'question_page',
  );
  final String name;

  const QuestionPage({super.key, required this.name});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final QuestionCubit _questionCubit;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _questionCubit = QuestionCubit.create()..getQuestions();
  }

  @override
  void dispose() {
    _questionCubit.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _questionCubit,
        child: SafeArea(
          child: BlocConsumer<QuestionCubit, QuestionState>(
            listener: (context, state) => state.maybeWhen(
              orElse: () => null,
              isSaved: (isSaved) {
                if (isSaved) {
                  return ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text('Success to save data!'),
                  ));
                }
                return ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text('Failed to save data!'),
                ));
              },
            ),
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (payload) => PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: payload.questions.length,
                itemBuilder: (conetxt, questionIndex) {
                  final questions = payload.questions[questionIndex];
                  final options = payload.options;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            questions.text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: options.length,
                            itemBuilder: (context, optionsIndex) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _questionCubit.setAnswer(
                                      options[optionsIndex].value,
                                      questionIndex,
                                    );
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                    _questionCubit.calculate();
                                    if (_pageController.page ==
                                        payload.questions.length - 1) {
                                      AutoRouter.of(context).popAndPush(
                                        ResultPageRoute(
                                          anxietyScore:
                                              _questionCubit.anxietyScore,
                                          depressionScore:
                                              _questionCubit.depressionScore,
                                          onTap: () {
                                            _questionCubit.save(widget.name);
                                            AutoRouter.of(context).pop();
                                          },
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    options[optionsIndex].text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
