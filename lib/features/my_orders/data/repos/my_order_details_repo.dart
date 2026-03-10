import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/my_orders/data/models/my_order_details_response_model.dart';

class MyOrderDetailsRepo {
  final ApiService _apiService;

  MyOrderDetailsRepo(this._apiService);

  Future<ApiResult<MyOrderDetailsResponseModel>> fetchOrderDetails(
    String id,
  ) async {
    try {
      final response = await _apiService.fetchOrderDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
