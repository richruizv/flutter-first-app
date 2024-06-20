import 'package:flutter/material.dart';
import 'package:flutter_test_app/question_screen.dart';
import 'package:flutter_test_app/result_screen.dart';
import 'package:flutter_test_app/start_screen.dart';
import 'package:flutter_test_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String? activeScreen;

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  @override
  Widget build(context) {
    var screen;

    switch (activeScreen) {
      case 'start':
        screen = StartScreen(switchScreen);
        break;
      case 'question':
        screen = QuestionScreen(onSelectAnswer: selectAnswer);
        break;
      case 'result':
        screen = ResultScreen(chosenAnswers: selectedAnswers);
        break;
      default:
        screen = StartScreen(switchScreen);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 68),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: screen),
      ),
    );
  }
}
