import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/routing/app_router.dart';
import 'package:hungry/core/routing/routes.dart';

class HungryApp extends StatelessWidget {
  final AppRouter appRouter;
  const HungryApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        onGenerateRoute:appRouter.generateRoute,
        initialRoute: Routes.loginScreen,
        ),
    );
  }
}
