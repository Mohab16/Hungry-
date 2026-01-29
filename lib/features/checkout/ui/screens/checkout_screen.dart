// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/core/widgets/total_price.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/checkout/data/models/checkout_body_model.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:hungry/features/checkout/ui/widgets/checkout_bloc_listener.dart';

class CheckoutScreen extends StatefulWidget {
  final double price;
  const CheckoutScreen({
    super.key,
    required this.price,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod = "";
  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>();
  }
  @override
  
  Widget build(BuildContext context) {
      final double totalPrice=widget.price+20;
  final orderList=context.read<CartCubit>().state.items;

    return CheckoutBlocListener(
      child: Scaffold(
        backgroundColor: MyColors.lightestGrey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),
                verticalSpacing(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            
                    children: [
                      Text(
                        "Order summary",
                        style: MyStyles.font20PoppinsRedBricksSemiBold,
                      ),
                      verticalSpacing(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTextRow(
                              "Order including taxes",
                              "${widget.price} LE",
                              MyStyles.font18RobotoGreyRegular,
                            ),
                            verticalSpacing(15),
                            
                            _buildTextRow(
                              "Delivery fees",
                              "20.0 LE",
                              MyStyles.font18RobotoGreyRegular,
                            ),
                            verticalSpacing(10),
                            Container(color: MyColors.moreMediumGrey, height: 1.h),
                            verticalSpacing(20),
                            _buildTextRow(
                              "Total:",
                              "$totalPrice",
                              MyStyles.font18RobotoRedBricksBold,
                            ),
                            verticalSpacing(20),
                            _buildTextRow(
                              "Estimated delivery time:",
                              "15 - 30 mins",
                              MyStyles.font14RobotoRedBricksSemiBold,
                            ),
                          ],
                        ),
                      ),
                      verticalSpacing(60),
                      Text(
                        "Payment methods",
                        style: MyStyles.font20PoppinsRedBricksSemiBold,
                      ),
                      verticalSpacing(20),
                      _buildRadioListTile(
                        Image.asset(
                          "assets/images/dollar_icon.png",
                          height: 72.h,
                          width: 72.w,
                        ),
                        "Cash on delivery",
                        "Cash on delivery",
                      ),
                      verticalSpacing(15),
                      _buildRadioListTile(
                        Image.asset(
                          "assets/images/visa_logo.png",
                          height: 72.h,
                          width: 72.w,
                        ),
                        "Debit card",
                        "Debit card",
                      ),
                     verticalSpacing(185),
                      TotalPrice(buttonText: "Checkout", price: "$totalPrice",onPressed: (){
                        if(selectedPaymentMethod!=""){
                         context.read<CheckoutCubit>().emitCheckoutState(
                          CheckOutBodyModel(items: orderList)
                         );
                        }
                      },),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadioListTile<String> _buildRadioListTile(
    Widget img,
    String centerText,
    String radioValue,
  ) {
    return RadioListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          horizontalSpacing(8),
          img,
          horizontalSpacing(22),
          Text(
            centerText,
            style: selectedPaymentMethod == radioValue
                ? MyStyles.font20RobotoWhiteMedium
                : MyStyles.font20RobotoRedBricksMedium,
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
      activeColor: Colors.white,
      controlAffinity: ListTileControlAffinity.trailing,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: selectedPaymentMethod == radioValue
          ? MyColors.redBricks
          : MyColors.mediumGrey,

      value: radioValue,
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        value == "Cash on delivery"
            ? setState(() {
                selectedPaymentMethod = value;
              })
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Text("Coming soon"),
                ),
              );
      },
    );
  }

  Row _buildTextRow(String label, String value, TextStyle textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyle),
        Text(value, style: textStyle),
      ],
    );
  }
}
