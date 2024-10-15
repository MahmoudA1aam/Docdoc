import 'package:docdoc_app/core/routing/route_names.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/helper/snackbar_widget.dart';

import '../cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          EasyLoading.show();
        } else if (state is LoginErrorState) {
          if (state.apiErrorModel.message ==
              "Credentials doesn`t match our records") {
            EasyLoading.dismiss();
            SnackBarService.showErrorMessage("check your email and password");
          } else {
            EasyLoading.dismiss();
            SnackBarService.showErrorMessage(state.apiErrorModel.message!);
          }
        } else if (state is LoginSuccessState) {
          EasyLoading.dismiss();
          SnackBarService.showSuccessMessage(
              "Hello ${state.loginResponseModel.userData?.userName}");

          Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
