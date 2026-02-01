import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_cubit.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_state.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthGateCubit, AuthGateState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (route) => false,
          );
        } else if (state is Unauthenticated) {
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthGateCubit,AuthGateState>(
        builder: (context, state) {
          if(state is Loading){
            context.read<AuthGateCubit>().checkAuth();
            return  Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator(color: MyColors.darkGreen,)),
            );
          }
          return const Scaffold(body: SizedBox.shrink());
        },
        
       ),
    );
  }
}
