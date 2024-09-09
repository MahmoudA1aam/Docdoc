import 'package:docdoc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.obscureText,
      this.suffixIcon,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.keyboardType,
      this.fillColor,
      this.filedColorBackground,
      required this.hintText});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filedColorBackground;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsApp.mainBlue,
      obscureText: obscureText ?? false,
      style: TextStyles.font14DartBlueMedium,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: filedColorBackground ?? true,
          fillColor: fillColor ?? ColorsApp.moreLightGray,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          hintText: hintText,
          isDense: true,
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: ColorsApp.mainBlue,
                    width: 1.3,
                  )),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: ColorsApp.lightGray,
                    width: 1.3,
                  ))),
    );
  }
}
