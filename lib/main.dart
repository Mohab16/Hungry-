import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/dependency_injection.dart';
import 'package:hungry/core/routing/app_router.dart';
import 'package:hungry/hungry_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await FastCachedImageConfig.init(
    clearCacheAfter: Duration(days: 7)
  );
  runApp(HungryApp(appRouter: AppRouter(),));
}

