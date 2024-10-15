import 'package:docdoc_app/data/sign_up/models/sign_up_request_body_model.dart';
import 'package:docdoc_app/features/auth/sign_up/widgets/all_Text_Field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_style.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../login/widgets/login_bloc_listener.dart';
import '../../login/widgets/terms_and_conditions_text.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/sign_up_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                "Create Account",
                style: TextStyles.font24BlackBold
                    .copyWith(color: ColorsApp.mainBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14grayRegular,
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: [
                  const AllTextField(),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextButton(
                      buttonText: "Create Account",
                      onPressed: () {
                        context.read<SignUpCubit>().signUp(
                            SignUpRequestBodyModel(
                                gender: "0",
                                name: context
                                    .read<SignUpCubit>()
                                    .nameController
                                    .text,
                                phone: context
                                    .read<SignUpCubit>()
                                    .phoneController
                                    .text,
                                rePassword: context
                                    .read<SignUpCubit>()
                                    .rePasswordController
                                    .text,
                                email: context
                                    .read<SignUpCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<SignUpCubit>()
                                    .passwordController
                                    .text));
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
                  const AlreadyHaveAccountText(),
                  const SignUpBlocListener(),
                ],
              )
            ],
          ),
        ),
      )),
    );
    ;
  }
}
