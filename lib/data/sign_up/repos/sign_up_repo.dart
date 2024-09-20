import 'package:docdoc_app/core/api_helper/api_error_handler.dart';
import 'package:docdoc_app/core/api_helper/api_result.dart';
import 'package:docdoc_app/core/networking/api_manager.dart';
import 'package:docdoc_app/data/sign_up/models/sign_up_request_body_model.dart';
import 'package:either_dart/either.dart';

import '../../../core/api_helper/api_error_model.dart';
import '../models/sign_up_response_model.dart';

class SignUpRepo {
  late ApiManager apiManager;

  SignUpRepo({required this.apiManager});

  Future<ApiResult<SignUpResponseModel>> signUp(
      SignUpRequestBodyModel signUpRequestBodyModel) async {

    try{
      final response = await apiManager.signUp(signUpRequestBodyModel);
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ApiErrorHandler.handle(error));

    }
  }
}
