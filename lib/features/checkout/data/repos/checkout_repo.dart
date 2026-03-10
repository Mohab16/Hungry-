import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/checkout/data/models/checkout_body_model.dart';
import 'package:hungry/features/checkout/data/models/checkout_response_model.dart';

class CheckoutRepo {
  final ApiService _apiService;

  CheckoutRepo(this._apiService);

  Future <ApiResult<CheckOutResponseModel>> checkout(CheckOutBodyModel checkoutBodyModel) async {
  try{
        final response=await _apiService.checkout(checkoutBodyModel);
     return ApiResult.success(response);
  }catch(error){
  return ApiResult.failure(ErrorHandler.handle(error));
  }    
  }
}