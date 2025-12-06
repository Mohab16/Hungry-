import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/app_text_form_field.dart';
import 'package:hungry/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:hungry/features/signup/ui/widgets/image_picker.dart';
import 'package:hungry/features/signup/ui/widgets/name_email_phone_and_password.dart';
import 'package:hungry/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                verticalSpacing(50),
               ImagePickerWidget(),
                
                verticalSpacing(30),
                NameEmailPhoneAndPassword(),
                verticalSpacing(20),
                AlreadyHaveAnAccount(),
                SignupBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
