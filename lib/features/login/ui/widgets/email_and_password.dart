import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/app_text_form_field.dart';
import 'package:hungry/features/login/data/models/login_request_body_model.dart';
import 'package:hungry/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  final formKey1 = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
  final cubit = context.read<LoginCubit>();

    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
     cubit.emailController.text = "";
    cubit.passwordController.text = "";
  }
  @override
  Widget build(BuildContext context) {
          final cubit=context.read<LoginCubit>();
    return Form(
      key: formKey1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            AppTextFormField(
              label: "Email",
              hint: "Enter your email",
              controller: cubit.emailController,
              validator: (value) {
                if(value==null||value.isEmpty){
                  return "Please enter a valid email";
                }
              },
            ),
            verticalSpacing(30),
            AppTextFormField(
              controller: cubit.passwordController,
              label: "Password",
              isObscure: isObscure,
              hint: "Enter your password",
              suffixIcon: IconButton(
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  color: MyColors.lightGrey,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ), validator: (value) {  
         if(value==null||value.isEmpty){
                  return "Please enter a valid password";
                }
              },
            ),
            verticalSpacing(40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.darkGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(395.w, 71.h),
              ),
              onPressed: () {
                validateThenDoLogin();
              },
              child: Text(
                "Login",
                style: MyStyles.font18RobotoWhiteSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  validateThenDoLogin() {
    if (formKey1.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
        LoginRequestBodyModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
