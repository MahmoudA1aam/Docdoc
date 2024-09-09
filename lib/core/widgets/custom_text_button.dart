import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.textStyle,
      this.backgroundColor,
      this.borderRadius,
      this.buttonHeight,
      this.buttonWidth});

  final String buttonText;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: buttonHeight ?? 52.h,
        decoration: BoxDecoration(
            color: backgroundColor ?? ColorsApp.mainBlue,
            borderRadius: BorderRadius.circular(borderRadius ?? 16)),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
