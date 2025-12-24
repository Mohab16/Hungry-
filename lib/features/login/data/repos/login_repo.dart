import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/core/storage/local_storage.dart';
import 'package:hungry/features/login/data/models/login_request_body_model.dart';
import 'package:hungry/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(LoginRequestBodyModel loginRequestBody) async{
   try{

 final response = await _apiService.login(loginRequestBody);
 final token=response.data!.token;
 final username=response.data!.name;
 final image=response.data!.image;
 if(token!=null&&token.isNotEmpty){
  await LocalStorage.saveToken(token);
 }
 if(image!=null&&image.isNotEmpty){
  await LocalStorage.saveUserImage(image);
 }
 if(username!=null&&username.isNotEmpty){
  await LocalStorage.saveUserName(username);
 }
   return ApiResult.success(response);
   }catch(error){
    return ApiResult.failure(ErrorHandler.handle(error));
   }
  }
}