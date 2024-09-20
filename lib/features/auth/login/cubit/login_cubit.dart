import 'package:bloc/bloc.dart';
import 'package:docdoc_app/core/api_helper/api_error_model.dart';
import 'package:docdoc_app/data/login/models/login_request_body_model.dart';
import 'package:docdoc_app/data/login/models/login_response_model.dart';
import 'package:docdoc_app/data/login/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());
  final LoginRepo loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate() == true) {
      LoginRequestBodyModel loginRequestBodyModel = LoginRequestBodyModel(
          email: emailController.text, password: passwordController.text);


        emit(LoginLoadingState());
        final response =
            await loginRepo.login(loginRequestBodyModel: loginRequestBodyModel);
        response.when(success: (data) {
          emit(LoginSuccessState(loginResponseModel: data));
        }, failure: (errorMessage) {
          emit(LoginErrorState(apiErrorModel: errorMessage));
        },);

    }
  }
}
