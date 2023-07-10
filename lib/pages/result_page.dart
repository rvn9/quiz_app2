import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int anxietyScore;
  final int depressionScore;
  final VoidCallback onTap;
  static const route = AdaptiveRoute(
    page: ResultPage,
    path: 'result_page',
  );
  const ResultPage({
    super.key,
    required this.anxietyScore,
    required this.depressionScore,
    required this.onTap,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Anxiety Score: ${widget.anxietyScore} & Depression Score: ${widget.depressionScore}"),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Are you sure want to save this data ?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => AutoRouter.of(context).pop(),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: widget.onTap,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                ),
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
