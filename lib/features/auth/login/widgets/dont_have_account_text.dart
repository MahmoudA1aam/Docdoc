import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';



class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "dont have an account yet? ",
            style: TextStyles.font11DarkBlueRegular,
          ),

          TextSpan(
recognizer: TapGestureRecognizer()..onTap=(){
  Navigator.pushReplacementNamed(context, RouteNames.signUpScreen);
},
            text: " Sign Up",
            style: TextStyles.font11MainBlueRegular,
          ),

        ]));
  }
}
