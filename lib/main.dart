import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: GradientContainer(),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  @override
  Widget build(context){
    return Container(
          decoration: const BoxDecoration( 
            gradient: LinearGradient( colors: [ 
              Color(0xFF0f2027),
              Color(0xFF203a43),
              Color(0xFF2c5364),],
              )),
          child: const Center(
            child: Text('Hello World!', style: TextStyle(color: Colors.white, fontSize: 28),),
          ),
        );
    
  }

}