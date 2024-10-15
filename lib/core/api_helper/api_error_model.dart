import 'package:json_annotation/json_annotation.dart';

part "api_error_model.g.dart";

@JsonSerializable()
class ApiErrorModel {
  final String? message;

  final int? code;
  @JsonKey(name: "data")
  Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessage() {
    if (errors == null && errors!.isNotEmpty) {
      return message ?? "Unknown Error Occurred";
    }

    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(',')}";
    }).join('\n');
    return errorMessage;
  }
}
