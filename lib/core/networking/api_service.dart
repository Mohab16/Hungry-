import 'package:dio/dio.dart';
import 'package:hungry/core/networking/api_constants.dart';
import 'package:hungry/features/checkout/data/models/checkout_body_model.dart';
import 'package:hungry/features/checkout/data/models/checkout_response_model.dart';
import 'package:hungry/features/home/data/models/home_products_model.dart';
import 'package:hungry/features/home/data/models/side_options_model.dart';
import 'package:hungry/features/home/data/models/toppings_model.dart';
import 'package:hungry/features/login/data/models/login_request_body_model.dart';
import 'package:hungry/features/login/data/models/login_response_model.dart';
import 'package:hungry/features/my_orders/data/models/my_orders_response_model.dart';
import 'package:hungry/features/signup/data/models/signup_request_body_model.dart';
import 'package:hungry/features/signup/data/models/signup_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';
@RestApi(baseUrl:ApiConstants.baseUrl)
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

@POST(ApiConstants.login)
Future<LoginResponseModel> login(
 @Body() LoginRequestBodyModel loginRequestBody,
);

@POST(ApiConstants.register)
Future<SignupResponseModel> signup(
 @Body() SignupRequestBodyModel signupRequestBody,
);

@GET(ApiConstants.homeproducts)
Future <HomeProductsModel> fetchProducts(

);

@GET(ApiConstants.toppings)
Future<ToppingsModel> fetchToppings();

@GET(ApiConstants.sideOptions)
Future<SideOptionsModel> fetchSideOptions();

@POST(ApiConstants.checkOut)
Future <CheckOutResponseModel> checkout(
  @Body() CheckOutBodyModel checkoutBodyModel
);

@GET(ApiConstants.myOrders)
Future <MyOrdersResponseModel> fetchMyOrders();

}
