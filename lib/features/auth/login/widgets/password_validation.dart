import 'package:docdoc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_style.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLength});

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At Least 1 lowerCase letter', hasLowerCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At Least 1 upperCase letter', hasUpperCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow(
            'At Least 1 special Characters letter', hasSpecialCharacters),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At Least 1 number letter', hasNumber),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At Least 8 characters letter', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsApp.gray,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsApp.gray : ColorsApp.darkBlue),
        )
      ],
    );
  }
}
