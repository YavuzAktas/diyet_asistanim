import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diyet_asistanim/product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            title,
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
    );
  }
}
