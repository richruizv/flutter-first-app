import 'package:flutter/material.dart';
import './styled_text.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer(this.colors, {key}): super(key: key);

  void rollDice(){

  }

  
  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration( 
            gradient: LinearGradient(colors: colors)
            ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/dice-5.png', width: 200,),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: rollDice, 
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)
                    ),
                  child: const Text('Roll Dice')
                  )
              ],
            ),
          ),
        );
  }
}