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
      this.errorBorder,
      this.focusedErrorBorder,
      required this.validator,
      required this.hintText,
      required this.controller});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filedColorBackground;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      controller: controller,
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
          errorBorder: errorBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  )),
          focusedErrorBorder: focusedErrorBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  )),
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
