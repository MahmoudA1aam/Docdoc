import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "By logging, you agree to our",
            style: TextStyles.font11GrayRegular,
          ),
          TextSpan(
            text: " Terms & Conditions ",
            style: TextStyles.font11DarkBlueRegular,
          ),
          TextSpan(
            text: "and \n",
            style: TextStyles.font11GrayRegular,
          ),
          TextSpan(
            text: "PrivacyPolicy.",
            style: TextStyles.font11DarkBlueRegular.copyWith(height: 1.8),
          ),
        ]));
  }
}
