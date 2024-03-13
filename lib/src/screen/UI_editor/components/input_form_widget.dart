import 'dart:async';

import 'package:flutter/material.dart';

class CustomInputForm extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final Color? hintColor;
  final int? numberMaxLine;
  final int? numberMinLine;
  final TextEditingController? textEditingController;

  const CustomInputForm(
      {Key? key,
      required this.hintText,
      this.textEditingController,
      this.fontSize,
      this.hintColor,
      this.numberMaxLine,
      this.numberMinLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        textEditingController ?? TextEditingController();
    return TextField(
      controller: controller,
      maxLines: numberMaxLine,
      minLines: numberMinLine,
      style: TextStyle(
        fontSize: fontSize,
        color: hintColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: hintColor,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
