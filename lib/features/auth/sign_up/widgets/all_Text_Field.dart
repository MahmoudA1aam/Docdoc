import 'package:docdoc_app/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../login/widgets/password_validation.dart';

class AllTextField extends StatefulWidget {
  const AllTextField({super.key});

  @override
  State<AllTextField> createState() => _AllTextFieldState();
}

class _AllTextFieldState extends State<AllTextField> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
    // TODO: implement initState
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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.name,
            controller: context.read<SignUpCubit>().nameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "please enter a valid name";
              }
            },
            hintText: "Name",
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomTextFormField(
            keyboardType: TextInputType.phone,
            controller: context.read<SignUpCubit>().phoneController,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !AppRegex.isPhoneNumberValid(
                      context.read<SignUpCubit>().phoneController.text)) {
                return "please enter a valid email";
              }
            },
            hintText: "Phone",
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: context.read<SignUpCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !AppRegex.isEmailValid(
                      context.read<SignUpCubit>().emailController.text)) {
                return "please enter a valid email";
              }
            },
            hintText: "Email",
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.hasMinLength(
                      context.read<SignUpCubit>().passwordController.text) ||
                  !AppRegex.hasNumber(
                      context.read<SignUpCubit>().passwordController.text) ||
                  !AppRegex.hasSpecialCharacter(
                      context.read<SignUpCubit>().passwordController.text) ||
                  !AppRegex.hasUpperCase(
                      context.read<SignUpCubit>().passwordController.text) ||
                  !AppRegex.hasLowerCase(
                      context.read<SignUpCubit>().passwordController.text)) {
                return "please enter a valid password";
              }
            },
            hintText: "Password",
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().rePasswordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.hasMinLength(
                      context.read<SignUpCubit>().rePasswordController.text) ||
                  !AppRegex.hasNumber(
                      context.read<SignUpCubit>().rePasswordController.text) ||
                  !AppRegex.hasSpecialCharacter(
                      context.read<SignUpCubit>().rePasswordController.text) ||
                  !AppRegex.hasUpperCase(
                      context.read<SignUpCubit>().rePasswordController.text) ||
                  !AppRegex.hasLowerCase(
                      context.read<SignUpCubit>().rePasswordController.text)) {
                return "please enter a valid rePassword";
              } else if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return "the value of rePassword not match of Password";
              }
            },
            hintText: "rePassword",
            obscureText:isObscureText ,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
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
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}
