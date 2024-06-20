import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    const userAnswerColor = Color.fromARGB(255, 212, 87, 189);
    const correctAnswerColor = Color.fromARGB(255, 169, 195, 239);
    final circleColor = data["user_answer"] == data["correct_answer"]
        ? correctAnswerColor
        : userAnswerColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Text(((data['question_index'] as int) + 1).toString())),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text((data['question'] as String),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text(
                (data['user_answer'] as String),
                style: const TextStyle(color: userAnswerColor),
              ),
              Text(
                (data['correct_answer'] as String),
                style: const TextStyle(color: correctAnswerColor),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}
