import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/features/onBoarding/widgets/doc_Logo&name.dart';
import 'package:docdoc_app/features/onBoarding/widgets/image&text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routing/route_names.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(
                height: 30.h,
              ),
              const ImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Manage and schedule all of your medical appointments easily \nwith Docdoc to get a new experience.",
                      textAlign: TextAlign.center,
                      style: TextStyles.font10grayRegular,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextButton(
                        buttonText: "Get Start",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.loginScreen);
                        },
                        textStyle: TextStyles.font16whiteSemiBold)
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
