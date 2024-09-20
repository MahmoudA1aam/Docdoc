import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/route_names.dart';
import '../../../../core/theming/text_style.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Already have an account yet? ",
            style: TextStyles.font11DarkBlueRegular,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
              },
            text: " Login",
            style: TextStyles.font11MainBlueRegular,
          ),
        ]));
    ;
  }
}
