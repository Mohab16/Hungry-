import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/di/dependency_injection.dart';
import 'package:hungry/core/routing/routes.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
