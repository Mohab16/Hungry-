import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/di/dependency_injection.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_cubit.dart';
import 'package:hungry/features/auth_gate/ui/screens/auth_gate_screen.dart';
import 'package:hungry/features/cart/ui/screens/cart_screen.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:hungry/features/checkout/ui/screens/checkout_screen.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/logic/cubit/product_details_cubit.dart';
import 'package:hungry/features/home/logic/cubit/side_options_cubit.dart';
import 'package:hungry/features/home/logic/cubit/toppings_cubit.dart';
import 'package:hungry/features/home/ui/screens/home_screen.dart';
import 'package:hungry/features/home/ui/screens/product_details_screen.dart';
import 'package:hungry/features/login/logic/cubit/login_cubit.dart';
import 'package:hungry/features/login/ui/screens/login_screen.dart';
import 'package:hungry/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:hungry/features/signup/logic/cubit/signup_cubit.dart';
import 'package:hungry/features/signup/ui/screens/signup_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.checkoutScreen:
        final price = arguments as double;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CheckoutCubit>(),
            child: CheckoutScreen(price: price),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
        );
      case Routes.authGateScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthGateCubit>(),
            child: AuthGateScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeProductsCubit>(),
            child: HomeScreen(),
          ),
        );
      case Routes.productDetailsScreen:
        final product = arguments;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<ToppingsCubit>()),
              BlocProvider(create: (context) => getIt<SideOptionsCubit>()),
              BlocProvider(create: (context) => ProductDetailsCubit()),
            ],
            child: ProductDetailsScreen(product: product),
          ),
        );

      case Routes.cartScreen:
        final homeProductCubit = getIt<HomeProductsCubit>();
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: homeProductCubit, child: CartScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
