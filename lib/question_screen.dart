import 'package:flutter/material.dart';
import 'package:flutter_test_app/answer_button.dart';
import 'package:flutter_test_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.text,
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: AnswerButton(onPressed: () {}, text: answer));
              })
            ]),
      ),
    );
  }
}
