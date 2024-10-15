import 'package:docdoc_app/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/helper/snackbar_widget.dart';
import '../../../../core/routing/route_names.dart';
import '../../login/cubit/login_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpErrorState ||
          current is SignUpSuccessState,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          EasyLoading.show();
        } else if (state is SignUpErrorState) {
          EasyLoading.dismiss();
          SnackBarService.showErrorMessage(
              state.errorMessage!.getAllErrorMessage());
        } else if (state is SignUpSuccessState) {
          EasyLoading.dismiss();
          SnackBarService.showSuccessMessage("${state.response.message}");

          Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
