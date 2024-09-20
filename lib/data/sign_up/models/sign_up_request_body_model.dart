import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body_model.g.dart';

@JsonSerializable()
class SignUpRequestBodyModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "rePassword")
  final String rePassword;
  @JsonKey(name: "phone")
  final String phone;

  SignUpRequestBodyModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyModelToJson(this);
}
