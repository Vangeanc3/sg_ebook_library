import 'package:flutter/material.dart';
import 'package:grimorio/theme.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: DisplayTextProperties.textStyle,
      ),
    );
  }
}
