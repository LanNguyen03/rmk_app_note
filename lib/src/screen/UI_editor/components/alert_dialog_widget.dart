import 'package:flutter/material.dart';
import 'package:rmk_note/src/config/app_colors.dart';
import 'package:rmk_note/src/config/app_space.dart';

class CustomAlertDialogButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomAlertDialogButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 112,
        height: 39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(BorderSize.sizeSmall)),
          color: color,
        ),
        child: Center(
          child: Text(
            text ?? '',
            style: const TextStyle(color: AppColors.colorWhite),
          ),
        ),
      ),
    );
  }
}
