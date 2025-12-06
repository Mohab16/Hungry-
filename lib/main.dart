import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/dependency_injection.dart';
import 'package:hungry/core/routing/app_router.dart';
import 'package:hungry/hungry_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(HungryApp(appRouter: AppRouter(),));
}

