import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_orders_cubit.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_orders_state.dart';
import 'package:hungry/features/my_orders/ui/widgets/custom_list_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyOrdersCubit>().emitMyOrdersState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: MyColors.lightestGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomBackButton()),
                  verticalSpacing(10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "My orders",
                      style: MyStyles.font35LuckiestGuyDarkGreenRegular,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacing(10),
            BlocBuilder<MyOrdersCubit, MyOrdersState>(
              builder: (context, state) {
               final isLoading= state.maybeWhen(
                  success:(data) =>  false,
                  orElse:() =>  true
                );
                return Expanded(
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: ListView.builder(
                      itemCount: state.when(
                        initial: () => 0,
                        loading: () => 1,
                        success: (data) => data.data.length,
                        error: (error) => 0,
                      ),
                      itemBuilder: (context, index) {
                        return state.when(
                          initial: () => SizedBox.shrink(),
                          success: (data) {
                            return CustomListTile(
                              isLoading: isLoading,
                              imageUrl: data.data[index].productImage,
                              createdAt: data.data[index].createdAt,
                              totalPrice: addDeliveryFees(data.data[index].totalPrice),
                            );
                          },
                          loading: () =>CustomListTile( 
                            isLoading: isLoading,
                             imageUrl: 'https://via.placeholder.com/150', 
              createdAt: '2024-01-01', 
              totalPrice: '99.99', ),
                          error: (error) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  icon: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                  content: Text(
                                    error,
                                    style: MyStyles.font18RobotoDarkGreenSemiBold,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Text(
                                        "Got it",
                                        style: MyStyles
                                            .font15RobotoDarkGreenSemiBold,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                    
                            return SizedBox.shrink();
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
String addDeliveryFees(String oldPrice){
  final orderPrice=double.parse(oldPrice);
  final finalPrice=(orderPrice+20).toString();
  return finalPrice;

}
