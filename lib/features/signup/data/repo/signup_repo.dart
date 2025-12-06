import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/signup/data/models/signup_request_body_model.dart';
import 'package:hungry/features/signup/data/models/signup_response_model.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);
  Future <ApiResult<SignupResponseModel>> signup(SignupRequestBodyModel signupRequestBody) async {
    try{
      final response=await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    }catch(error){
     return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}