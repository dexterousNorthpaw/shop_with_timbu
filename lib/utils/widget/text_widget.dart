import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  final String textContent;
  final String fontFamily;
  final double fontSize;
  final String fontWeight;

  ReuseableText({
    required this.textContent,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
// if(fontWeight=="600"){
//   fontWeight =
// }

    return Text(textContent);
  }
}
