import 'package:flutter/material.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/features/onboarding/ui/screens/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings){
    // ignore: unused_local_variable
    final arguments=settings.arguments;
    switch(settings.name){
        case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
         default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}