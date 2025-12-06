// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/themes/my_colors.dart';

import 'package:hungry/core/themes/my_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? isObscure;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final Function (String?) validator;

  const AppTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.isObscure,
    this.suffixIcon, required this.controller, required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscuringCharacter: "⬤" ,
validator:(value) {
  return validator(value);
},
      obscureText: isObscure ?? false,
      style: MyStyles.font15RobotoDarkGreenSemiBold,
      cursorColor: MyColors.darkGreen,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: suffixIcon,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 22.h),
        hint: Text(hint, style: MyStyles.font15RobotoLightGreyMedium),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(label, style: MyStyles.font20RobotoDarkGreenMedium),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(color: MyColors.darkGreen, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(color: MyColors.darkGreen, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(color: MyColors.darkGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
