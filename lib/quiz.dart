import 'package:flutter/material.dart';
import 'package:flutter_test_app/question_screen.dart';
import 'package:flutter_test_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
  }

  switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: selectAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 68),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: activeScreen),
      ),
    );
  }
}
