import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app2/router/router.gr.dart';

class HomePage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: HomePage,
    path: 'home_page',
  );

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _textEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Please insert your name'),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name.',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'name cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    AutoRouter.of(context).replace(
                        QuestionPageRoute(name: _textEditingController.text));
                    _textEditingController.clear();
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
