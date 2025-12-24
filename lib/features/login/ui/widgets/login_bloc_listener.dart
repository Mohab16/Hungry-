import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/login/logic/cubit/login_cubit.dart';
import 'package:hungry/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(color: MyColors.darkGreen),
              );
            },
          ),
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  setupErrorState(BuildContext context, String error) {
    context.pop();
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
