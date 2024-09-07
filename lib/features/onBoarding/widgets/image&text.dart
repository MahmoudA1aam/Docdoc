import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/doc_logo_backGround.svg",
          height: 443.07.h,
          width: 443.w,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, 0.4]),
          ),
          child: Image.asset(
            "assets/images/Image.png",
            width: 375.w,
            height: 491.h,
          ),
        ),
        Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Text(
              textAlign: TextAlign.center,
              "Best Doctor\nAppointment App",
              style: TextStyles.font32mainBlue700weight.copyWith(height: 1.4),
            ))
      ],
    );
  }
}
