import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/questions.dart';
import 'package:flutter_test_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "user_answer": chosenAnswers[i],
        "correct_answer": questions[i].answers[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [QuestionSummary(summaryData: getSummaryData())],
        ),
      ),
    );
  }
}
