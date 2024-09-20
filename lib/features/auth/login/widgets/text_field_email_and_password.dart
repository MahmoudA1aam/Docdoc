import 'package:docdoc_app/core/helper/app_regex.dart';
import 'package:docdoc_app/features/auth/login/widgets/password_validation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

import '../cubit/login_cubit.dart';

class TextFieldEmailAndPassword extends StatefulWidget {
  const TextFieldEmailAndPassword({super.key});

  @override
  State<TextFieldEmailAndPassword> createState() =>
      _TextFieldEmailAndPasswordState();
}

class _TextFieldEmailAndPasswordState extends State<TextFieldEmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(() {
          hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
          hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
          hasSpecialCharacters =
              AppRegex.hasSpecialCharacter(passwordController.text);
          hasNumber = AppRegex.hasNumber(passwordController.text);
          hasMinLength = AppRegex.hasMinLength(passwordController.text);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: context.read<LoginCubit>().emailController,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !AppRegex.isEmailValid(
                        context.read<LoginCubit>().emailController.text)) {
                  return "please enter a valid email";
                }
              },
              hintText: "Email",
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasMinLength(
                        context.read<LoginCubit>().passwordController.text) ||
                    !AppRegex.hasNumber(
                        context.read<LoginCubit>().passwordController.text) ||
                    !AppRegex.hasSpecialCharacter(
                        context.read<LoginCubit>().passwordController.text) ||
                    !AppRegex.hasUpperCase(
                        context.read<LoginCubit>().passwordController.text) ||
                    !AppRegex.hasLowerCase(
                        context.read<LoginCubit>().passwordController.text)) {
                  return "please enter a valid password";
                }
              },
              obscureText:isObscureText ,
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            PasswordValidation(
              hasMinLength: hasMinLength,
              hasLowerCase: hasLowerCase,
              hasNumber: hasNumber,
              hasSpecialCharacters: hasSpecialCharacters,
              hasUpperCase: hasUpperCase,
            ),
          ],
        ));
  }

// @override
// void dispose() {
//   passwordController.dispose();
//   super.dispose();
// }
}
