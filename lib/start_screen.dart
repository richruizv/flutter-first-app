import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Opacity(
          opacity: 0.4,
          child: Image(
            // This also could be declared with the constructor Image.asset()
            image: AssetImage('images/quiz-logo.png'),
            width: 200,
          ),
        ),
        const SizedBox(height: 40),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            onPressed: () {
              print('its way too late');
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start quiz',
            ))
      ],
    ));
  }
}
