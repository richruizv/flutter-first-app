import 'package:flutter/material.dart';
import './styled_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({key}): super(key: key);
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
            child: StyledText(),
          ),
        );
  }
}