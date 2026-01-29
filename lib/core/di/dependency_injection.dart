import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry/core/networking/api_service.dart';
import 'package:hungry/core/networking/dio_factory.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_cubit.dart';
import 'package:hungry/features/checkout/data/repos/checkout_repo.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:hungry/features/home/data/repos/home_products_repo.dart';
import 'package:hungry/features/home/data/repos/side_options_repo.dart';
import 'package:hungry/features/home/data/repos/toppings_repo.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/logic/cubit/side_options_cubit.dart';
import 'package:hungry/features/home/logic/cubit/toppings_cubit.dart';
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
  // Toppings
  getIt.registerLazySingleton<ToppingsRepo>(() => ToppingsRepo(getIt<ApiService>()));
  getIt.registerFactory<ToppingsCubit>(() => ToppingsCubit(getIt<ToppingsRepo>()));
  // Side options
  getIt.registerLazySingleton<SideOptionsRepo>(() => SideOptionsRepo(getIt<ApiService>()));
  getIt.registerFactory<SideOptionsCubit>(() => SideOptionsCubit(getIt<SideOptionsRepo>()));
  //Auth gate
  getIt.registerFactory<AuthGateCubit>(() => AuthGateCubit());
  //Checkout
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt<ApiService>()));
  getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt<CheckoutRepo>()));
  

}
