import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/storage/local_storage.dart';

import 'package:hungry/core/themes/my_colors.dart';

class BottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const BottomBar({super.key, required this.onTap, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 20.h),

      height: 94.h,
      decoration: BoxDecoration(
        color: MyColors.darkGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Image.asset(
              "assets/images/home_icon.png",
              width: 24.w,
              height: 24.h,
              color: currentIndex == 0 ? Colors.grey : Colors.white,
              filterQuality: FilterQuality.none,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Image.asset(
              "assets/images/cart_icon.png",
              width: 50.w,
              height: 50.h,
              color: currentIndex == 1 ? Colors.grey : Colors.white,
              filterQuality: FilterQuality.none,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Image.asset(
              "assets/images/my_orders_icon.png",
              width: 30.w,
              height: 30.h,
              filterQuality: FilterQuality.none,
              color: currentIndex == 2 ? Colors.grey : Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate:(route) => false,);
              LocalStorage.clearAll();
            },
            child: Image.asset(
              "assets/images/logout_icon.png",
              width: 26.w,
              height: 26.h,
                            color: currentIndex == 3 ? Colors.grey : Colors.white,
            
              filterQuality: FilterQuality.none,
            ),
          ),
        ],
      ),
    );
  }
}
