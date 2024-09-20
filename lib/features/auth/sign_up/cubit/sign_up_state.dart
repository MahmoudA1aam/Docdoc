part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {
  String? loadingMessage;

  SignUpLoadingState({this.loadingMessage});
}

final class SignUpErrorState extends SignUpState {
  ApiErrorModel? errorMessage;

  SignUpErrorState({this.errorMessage});
}

final class SignUpSuccessState extends SignUpState {
  SignUpResponseModel response;

  SignUpSuccessState({required this.response});
}
