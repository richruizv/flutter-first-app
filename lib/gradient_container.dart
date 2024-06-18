import 'package:flutter/material.dart';
import './dice_roller.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer(this.colors, {key}): super(key: key);


  
  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration( 
            gradient: LinearGradient(colors: colors)
            ),
          child: Center(
            child: DiceRoller()
          ),
        );
  }
}