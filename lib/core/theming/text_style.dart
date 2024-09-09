import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
      fontSize: 24.sp, color: Colors.black, fontWeight: FontWeightHelper.bold);
  static TextStyle font32mainBlueBold = TextStyle(
      fontWeight: FontWeightHelper.bold,
      fontSize: 32.sp,
      color: ColorsApp.mainBlue);
  static TextStyle font10grayRegular = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.gray);
  static TextStyle font14grayRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.gray);
  static TextStyle font16whiteSemiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.white);
  static TextStyle font14LightGrayRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.lightGray);
  static TextStyle font14DartBlueMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsApp.darkBlue);
  static TextStyle font12MainBlueRegular = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.mainBlue);
  static TextStyle font11GrayRegular = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.gray);
  static TextStyle font11DarkBlueRegular = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.darkBlue);
  static TextStyle font11MainBlueRegular = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsApp.mainBlue);
}
