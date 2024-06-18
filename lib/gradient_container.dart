import 'package:flutter/material.dart';
import './styled_text.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer(this.colors, {key}): super(key: key);

  
  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration( 
            gradient: LinearGradient(colors: colors)
            ),
          child: const Center(
            child: StyledText("Hello little one!"),
          ),
        );
  }
}