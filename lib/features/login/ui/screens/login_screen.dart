import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:hungry/features/login/ui/widgets/email_and_password.dart';
import 'package:hungry/features/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                verticalSpacing(80),
                Text("Hungry?",style: MyStyles.font60LuckiestGuyDarkGreenMedium,),
                verticalSpacing(100),
                EmailAndPassword(),
               
                verticalSpacing(40),
                DontHaveAnAccount(),
                LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


