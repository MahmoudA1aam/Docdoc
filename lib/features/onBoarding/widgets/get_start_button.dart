import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {

      },
      child: Container(
        alignment: Alignment.center,
        width: 311.w,
        height: 52.h,
        decoration: BoxDecoration(
            color: ColorsApp.mainBlue, borderRadius: BorderRadius.circular(16)),
        child: Text(
          "Get Started",
          style: TextStyles.font16whiteSemiBold,
        ),
      ),
    );
  }
}
