import 'package:flutter/material.dart';
import './gradient_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: GradientContainer(
            [Color(0xff12c2e9), Color(0xffc471ed), Color(0xfff64f59)]
        ),
      ),
    );
  }
}

