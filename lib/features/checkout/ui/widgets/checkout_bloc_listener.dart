import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutBlocListener extends StatelessWidget {
  final Widget child;
  const CheckoutBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
          listener: (context, state) {
            state.whenOrNull(
              loading: () => showDialog(context: context, builder:(context) => Center(child: CircularProgressIndicator(color: MyColors.darkGreen,)),),
              error:(error) => _buildErrorState(context, error),
              success:(data) => _buildSuccessState(context),
            );
          },
          child: child,
    );
  }
}
_buildErrorState(BuildContext context, String error){

   context.pop();
                 showDialog(
                  context: context,
                   builder:(context) {
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
        
                   }
                  );
}

_buildSuccessState(BuildContext context){
  context.pop();
  showDialog(
    context: context,
     builder:(context) {
       return AlertDialog(
               icon: Center(
                 child: CircleAvatar(
                  backgroundColor: MyColors.darkGreen,
                  radius: 45,
                  child: Icon(Icons.done, color: Colors.white, size: 90,),
                 ),
               ),
          content: Text("Success !", style: MyStyles.font30PoppinsDarkGreenBold,textAlign: TextAlign.center,),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 backgroundColor: MyColors.darkGreen,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                 ),
                 padding: EdgeInsets.symmetric(horizontal: 75.5.w,vertical: 16.h)
                ),
                onPressed: (){
                context.pop();
                context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (route) => false, );
                context.read<CartCubit>().emptyCart();
              }, child: Text("Go Home", style: MyStyles.font15RobotoWhiteSemiBold,)),
            )
          ],
       );
         
     }
    );

}
