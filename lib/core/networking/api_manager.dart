import 'package:dio/dio.dart';
import 'package:docdoc_app/core/api_helper/api_constants.dart';

import 'package:docdoc_app/data/login/models/login_response_model.dart';
import 'package:docdoc_app/data/sign_up/models/sign_up_request_body_model.dart';
import 'package:docdoc_app/data/sign_up/models/sign_up_response_model.dart';
import 'package:retrofit/http.dart';

import '../../data/login/models/login_request_body_model.dart';
import '../helper/shared_perf_helper.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(
      @Body() LoginRequestBodyModel loginRequestBodyModel);
  @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBodyModel signUpRequestBodyModel);
}

// class ApiManager {
//   final Dio dio;
//
//   ApiManager(this.dio);
//
// Future<Either<FailuresErrors, LoginResponseModel>> login(
//     LoginRequestBodyModel loginRequestBodyModel) async {
//   final List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());
//   if (connectivityResult.contains(ConnectivityResult.mobile) ||
//       connectivityResult.contains(ConnectivityResult.wifi)) {
//     var response = await dio.post(
//       ApiConstants.login,
//       data: loginRequestBodyModel.toJson(),
//     );
//     LoginResponseModel responseData =
//         LoginResponseModel.fromJson(response.data);
//
//     print("statusCode=${response.statusCode}");
//     if (response.statusCode! >= 200 && response.statusCode! < 300) {
//       print("sucess");
//       return Right(responseData);
//     } else {
//       print("error message");
//       return Left(FailuresErrors(errorMessage: responseData.message));
//     }
//   } else {
//     print("no interNet");
//     return Left(FailuresErrors(errorMessage: "Check internet connection"));
//   }
// }
//
// Future<Either<FailuresErrors, SignUpResponseModel>> signUp(
//     SignUpRequestBodyModel signUpRequestBodyModel) async {
//   final List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());
//   if (connectivityResult.contains(ConnectivityResult.mobile) ||
//       connectivityResult.contains(ConnectivityResult.wifi)) {
//     var response = await dio.post(
//       ApiConstants.signUp,
//       data: signUpRequestBodyModel.toJson(),
//     );
//     SignUpResponseModel responseData =
//         SignUpResponseModel.fromJson(response.data);
//
//     print("statusCode=${response.statusCode}");
//     if (response.statusCode! >= 200 && response.statusCode! < 300) {
//       print("sucess");
//       return Right(responseData);
//     } else {
//       print("error message");
//       return Left(FailuresErrors(errorMessage: responseData.message));
//     }
//   } else {
//     print("no interNet");
//     return Left(FailuresErrors(errorMessage: "Check internet connection"));
//   }
// }

// Future<Either<FailuresErrors, Response>> login(
//     LoginRequestBodyModel loginRequestBodyModel) async {
//   final List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());
//   if (connectivityResult.contains(ConnectivityResult.mobile) ||
//       connectivityResult.contains(ConnectivityResult.wifi)) {
//     Uri uri = Uri.https(ApiConstants.apiBaseUrl, ApiConstants.login);
//
//     final response =
//         await https.post(uri, body: loginRequestBodyModel.toJson());
//     print("success=${response.statusCode}");
//     Response loginResponse =
//     Response.fromJson(jsonDecode(response.body));
//     print("message=${loginResponse.message}");
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       print("success");
//       return Right(loginResponse);
//     } else {
//       print("errrrrrooorrr");
//       print("${response.statusCode}");
//       return Left(FailuresErrors(errorMessage: loginResponse.message));
//     }
//   } else {
//     //no internet
//     return Left(FailuresErrors(errorMessage: "Check internet connection"));
//   }
// }

// Future<Either<FailuresErrors, SignUpResponseModel>> signUp(
//     SignUpRequestBodyModel signUpRequestBodyModel) async {
//   final List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());
//   if (connectivityResult.contains(ConnectivityResult.mobile) ||
//       connectivityResult.contains(ConnectivityResult.wifi)) {
//     Uri uri = Uri.https(ApiConstants.apiBaseUrl, ApiConstants.login);
//
//     final response =
//         await https.post(uri, body: signUpRequestBodyModel.toJson());
//     print("success=${response.statusCode}");
//     SignUpResponseModel signUpResponseModel =
//         SignUpResponseModel.fromJson(jsonDecode(response.body));
//
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       print("success");
//       return Right(signUpResponseModel);
//     } else {
//       print("errrrrrooorrr");
//       print("${response.statusCode}");
//       return Left(FailuresErrors(errorMessage: signUpResponseModel.message));
//     }
//   } else {
//     //no internet
//     return Left(FailuresErrors(errorMessage: "Check internet connection"));
//   }
// }
// }
