// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:quiz_app2/pages/home_page.dart' as _i1;
import 'package:quiz_app2/pages/question_page.dart' as _i2;
import 'package:quiz_app2/pages/result_page.dart' as _i3;

class AppRouters extends _i4.RootStackRouter {
  AppRouters([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
        opaque: true,
      );
    },
    QuestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.QuestionPage(
          key: args.key,
          name: args.name,
        ),
        opaque: true,
      );
    },
    ResultPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ResultPage(
          key: args.key,
          anxietyScore: args.anxietyScore,
          depressionScore: args.depressionScore,
          onTap: args.onTap,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomePageRoute.name,
          path: 'home_page',
        ),
        _i4.RouteConfig(
          QuestionPageRoute.name,
          path: 'question_page',
        ),
        _i4.RouteConfig(
          ResultPageRoute.name,
          path: 'result_page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: 'home_page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.QuestionPage]
class QuestionPageRoute extends _i4.PageRouteInfo<QuestionPageRouteArgs> {
  QuestionPageRoute({
    _i5.Key? key,
    required String name,
  }) : super(
          QuestionPageRoute.name,
          path: 'question_page',
          args: QuestionPageRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'QuestionPageRoute';
}

class QuestionPageRouteArgs {
  const QuestionPageRouteArgs({
    this.key,
    required this.name,
  });

  final _i5.Key? key;

  final String name;

  @override
  String toString() {
    return 'QuestionPageRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i3.ResultPage]
class ResultPageRoute extends _i4.PageRouteInfo<ResultPageRouteArgs> {
  ResultPageRoute({
    _i5.Key? key,
    required int anxietyScore,
    required int depressionScore,
    required void Function() onTap,
  }) : super(
          ResultPageRoute.name,
          path: 'result_page',
          args: ResultPageRouteArgs(
            key: key,
            anxietyScore: anxietyScore,
            depressionScore: depressionScore,
            onTap: onTap,
          ),
        );

  static const String name = 'ResultPageRoute';
}

class ResultPageRouteArgs {
  const ResultPageRouteArgs({
    this.key,
    required this.anxietyScore,
    required this.depressionScore,
    required this.onTap,
  });

  final _i5.Key? key;

  final int anxietyScore;

  final int depressionScore;

  final void Function() onTap;

  @override
  String toString() {
    return 'ResultPageRouteArgs{key: $key, anxietyScore: $anxietyScore, depressionScore: $depressionScore, onTap: $onTap}';
  }
}
