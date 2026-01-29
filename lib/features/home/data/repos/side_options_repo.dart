import 'package:hungry/core/networking/api_error_handler.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/features/home/data/models/side_options_model.dart';

class SideOptionsRepo {
  final ApiService _apiService;

  SideOptionsRepo(this._apiService);

  Future<ApiResult<SideOptionsModel>> fetchSideOptions() async {
    try{
  final response = await _apiService.fetchSideOptions();
return ApiResult.success(response);
    }catch(error){
    return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}