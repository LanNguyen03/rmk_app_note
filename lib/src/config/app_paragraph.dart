import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({super.key, this.content = '', this.textStyle});
  final String content;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: textStyle,
    );
  }
}
