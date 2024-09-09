import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/text_style.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_form_field.dart';
import 'package:docdoc_app/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/already_have_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      CustomTextFormField(
                        obscureText: isObscureText,
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
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
                          onPressed: () {},
                          textStyle: TextStyles.font16whiteSemiBold,
                          buttonWidth: double.infinity),
                      SizedBox(
                        height: 25.h,
                      ),
                      TermsAndConditionsText(),
                      SizedBox(
                        height: 25.h,
                      ),
                      AlreadyHaveAccountText()
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
