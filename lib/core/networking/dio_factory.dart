import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static  Dio getDio() {
    Duration timeout = const Duration(seconds: 30);
    if(dio==null){
      dio = Dio()  ;
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
        addDioInterteptor();
        return dio!;
    }else{
      return dio!;
    }
  }
  static void addDioInterteptor(){
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      
      )
    );
  }
}