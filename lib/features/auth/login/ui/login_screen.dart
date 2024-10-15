import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/login_cubit.dart';
import '../widgets/dont_have_account_text.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/terms_and_conditions_text.dart';
import '../widgets/text_field_email_and_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlackBold
                    .copyWith(color: ColorsApp.mainBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "We're excited to have you back, can't wait to\n see what you've been up to since you last logged in.",
                style: TextStyles.font14grayRegular,
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: [
                  const TextFieldEmailAndPassword(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forget Password?",
                        style: TextStyles.font12MainBlueRegular,
                      )),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextButton(
                      buttonText: "Login",
                      onPressed: () {
                        context.read<LoginCubit>().login();
                      },
                      textStyle: TextStyles.font16whiteSemiBold,
                      buttonWidth: double.infinity),
                  SizedBox(
                    height: 25.h,
                  ),
                  const TermsAndConditionsText(),
                  SizedBox(
                    height: 25.h,
                  ),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
