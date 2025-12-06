import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/signup/logic/cubit/signup_cubit.dart';
import 'package:hungry/features/signup/logic/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
          showDialog(context: context, builder:(context) {
              return Center(
              child: CircularProgressIndicator(color: MyColors.darkGreen),
            );
          },);
          },
          success: (data) {
            context.pop();
            return buildSuccessState(context);
          },
          error: (error) {
            context.pop();
            return buildErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  Future<dynamic> buildSuccessState(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return  AlertDialog(
          icon: Icon(Icons.check_circle, color: MyColors.darkGreen, size: 32),
          content: Text(
            "Signedup successfully",
            style: MyStyles.font18RobotoDarkGreenSemiBold,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: (){
              context.pop();
              context.pushNamed(Routes.loginScreen);
            }, child: Text("Got it", style: MyStyles.font15RobotoDarkGreenSemiBold,))
          ],
        );
            },
          );
  }
  buildErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(
            error,
            style: MyStyles.font18RobotoDarkGreenSemiBold,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: (){
              context.pop();
            }, child: Text("Got it", style: MyStyles.font15RobotoDarkGreenSemiBold,))
          ],
        );
      },
    );
  }
}
