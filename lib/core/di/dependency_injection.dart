import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/core/networking/dio_factory.dart';
import 'package:hungry/features/home/data/repo/home_products_repo.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:hungry/features/login/logic/cubit/login_cubit.dart';
import 'package:hungry/features/signup/data/repo/signup_repo.dart';
import 'package:hungry/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiService>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));
  // Home screen products
  getIt.registerLazySingleton<HomeProductsRepo>(() => HomeProductsRepo(getIt<ApiService>()));
  getIt.registerFactory<HomeProductsCubit>(() => HomeProductsCubit(getIt<HomeProductsRepo>()));
}
