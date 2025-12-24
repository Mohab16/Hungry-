import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/home/data/models/home_products_model.dart';

class HomeProductsRepo {
  final ApiService _apiService;

  HomeProductsRepo(this._apiService);

  Future <ApiResult<HomeProductsModel>> fetchProducts (String? token) async{
   try {
          final response = await _apiService.fetchProducts(token);
          return ApiResult.success(response);

   }catch(error){
     return ApiResult.failure(ErrorHandler.handle(error));
   }    
  }
}