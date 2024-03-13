import 'package:flutter/material.dart';
import 'package:rmk_note/src/config/app_colors.dart';
import 'package:rmk_note/src/config/app_space.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderSize.sizeMedium),
        color: AppColors.colorWhiteShadow,
      ),
      height: Size.sizeMedium2,
      width: Size.sizeMedium2,
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
