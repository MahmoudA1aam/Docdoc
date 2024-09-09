import 'package:flutter/material.dart';

import '../../../core/theming/text_style.dart';

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
            text: " Sign Up",
            style: TextStyles.font11MainBlueRegular,
          ),

        ]));
  }
}
