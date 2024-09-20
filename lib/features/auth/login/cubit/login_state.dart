part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMessage;

  LoginLoadingState({this.loadingMessage});
}

class LoginSuccessState extends LoginState {
  LoginSuccessState({required this.loginResponseModel});

  LoginResponseModel loginResponseModel;
}

class LoginErrorState extends LoginState {
   ApiErrorModel apiErrorModel;

  LoginErrorState({ required this.apiErrorModel});
}
