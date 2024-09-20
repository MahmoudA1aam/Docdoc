import 'package:docdoc_app/core/api_helper/api_error_handler.dart';
import 'package:docdoc_app/core/api_helper/api_error_model.dart';
import 'package:docdoc_app/core/api_helper/api_result.dart';

import 'package:docdoc_app/core/networking/api_manager.dart';
import 'package:docdoc_app/data/login/models/login_request_body_model.dart';
import 'package:docdoc_app/data/login/models/login_response_model.dart';
import 'package:either_dart/either.dart';

class LoginRepo {
  final ApiManager _apiManager;

  LoginRepo(this._apiManager);

  Future<ApiResult<LoginResponseModel>> login(
      {required LoginRequestBodyModel loginRequestBodyModel}) async {
try{

  final response=await _apiManager.login(loginRequestBodyModel);
  return ApiResult.success(response);
}catch(error){
return ApiResult.failure(ApiErrorHandler.handle(error));
}
  }
}
