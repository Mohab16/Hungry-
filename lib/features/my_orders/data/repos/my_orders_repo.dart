import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/my_orders/data/models/my_orders_response_model.dart';

class MyOrdersRepo {
  final ApiService _apiService;

  MyOrdersRepo(this._apiService);

  Future <ApiResult<MyOrdersResponseModel>> fetchMyOrders() async{
    try{
     final response=await _apiService.fetchMyOrders();
     return ApiResult.success(response);
    }catch(error){
     return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}