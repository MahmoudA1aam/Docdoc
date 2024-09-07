import 'package:docdoc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
      fontSize: 24.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle font32mainBlue700weight = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 32.sp, color: ColorsApp.mainBlue);
  static TextStyle font10gray400weight = TextStyle(
      fontSize: 10.sp, fontWeight: FontWeight.w400, color: ColorsApp.gray);
  static TextStyle font16white600weight = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white);
}
