import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: GestureDetector(
                onTap:() => context.pop(),
                child: Image.asset("assets/images/left_arrow.png",width: 17.w,height: 15.h,)),
            );
  }
}