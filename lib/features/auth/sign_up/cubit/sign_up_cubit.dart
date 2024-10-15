import 'package:bloc/bloc.dart';
import 'package:docdoc_app/core/api_helper/api_error_model.dart';
import 'package:docdoc_app/data/sign_up/models/sign_up_request_body_model.dart';
import 'package:docdoc_app/data/sign_up/models/sign_up_response_model.dart';
import 'package:docdoc_app/data/sign_up/repos/sign_up_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitialState());
  late SignUpRepo signUpRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUp(SignUpRequestBodyModel signUpRequestBodyModel) async {
    if (formKey.currentState!.validate()) {
      emit(SignUpLoadingState(loadingMessage: "Loading..."));
      final response = await signUpRepo.signUp(signUpRequestBodyModel);
      response.when(
        success: (data) {
          emit(SignUpSuccessState(response: data));
        },
        failure: (errorMessage) {
          emit(SignUpErrorState(errorMessage: errorMessage));
        },
      );
    }
  }
}
