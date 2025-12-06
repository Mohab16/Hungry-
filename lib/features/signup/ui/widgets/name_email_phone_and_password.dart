import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/app_regex.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/app_text_form_field.dart';
import 'package:hungry/features/signup/data/models/signup_request_body_model.dart';
import 'package:hungry/features/signup/logic/cubit/signup_cubit.dart';

class NameEmailPhoneAndPassword extends StatefulWidget {
  const NameEmailPhoneAndPassword({super.key});

  @override
  State<NameEmailPhoneAndPassword> createState() =>
      _NameEmailPhoneAndPasswordState();
}

class _NameEmailPhoneAndPasswordState extends State<NameEmailPhoneAndPassword> {
  final formKey2 = GlobalKey<FormState>();
  bool isObscure=true;
  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignupCubit>();

    cubit.nameController.text = '';
    cubit.emailController.text = '';
    cubit.phoneController.text = '';
    cubit.passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: formKey2,
      child: Column(
        children: [
          AppTextFormField(
            label: "Name",
            hint: "Enter your name",
            controller: cubit.nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid name";
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            label: "Email",
            hint: "Enter your email",
            controller: cubit.emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter a valid email";
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            label: "Phone number",
            hint: "Enter your phone number",
            controller: cubit.phoneController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return "Please enter a valid phone number";
              }
            },
          ),
          verticalSpacing(20),
          AppTextFormField(
            isObscure: isObscure,
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
              ),
            label: "Password",
            hint: "Enter your password",
            controller: cubit.passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return "Please enter a valid password";
              }
            },
          ),
          verticalSpacing(20),
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
            child: Text("Signup", style: MyStyles.font18RobotoWhiteSemiBold),
          ),
        ],
      ),
    );
  }

  validateThenDoLogin() {
    if (formKey2.currentState!.validate()&&context.read<SignupCubit>().profileImage != null ) {
      final cubit = context.read<SignupCubit>();

      cubit.emitSignupState(
        SignupRequestBodyModel(
          email: cubit.emailController.text,
          name: cubit.nameController.text,
          phone: cubit.phoneController.text,
          password: cubit.passwordController.text,
        ),
      );
    } else if (context.read<SignupCubit>().profileImage == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please choose a profile picture")),
      );
    }
  }
  
}
