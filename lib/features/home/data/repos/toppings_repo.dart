import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/home/data/models/toppings_model.dart';

class ToppingsRepo {
  final ApiService _apiService;

  ToppingsRepo(this._apiService);

  Future<ApiResult<ToppingsModel>> fetchToppings() async {
    try{
    final response=await _apiService.fetchToppings();
    return ApiResult.success(response);
    }catch(error){
  return ApiResult.failure(ErrorHandler.handle(error));
    }
    
  }
}