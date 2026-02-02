import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/core/widgets/total_price.dart';
import 'package:hungry/features/cart/data/models/order_item_model.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/home/logic/cubit/side_options_cubit.dart';
import 'package:hungry/features/home/logic/cubit/toppings_cubit.dart';
import 'package:hungry/features/home/ui/widgets/customize_food_and_slider.dart';
import 'package:hungry/features/home/ui/widgets/side_options.dart';
import 'package:hungry/features/home/ui/widgets/toppings.dart';

class ProductDetailsScreen extends StatefulWidget {
  final product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ToppingsCubit>().emitToppings();
    context.read<SideOptionsCubit>().emitSideOptions();
    context.read<CartCubit>().productId = widget.product.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightestGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/burger_details.png",
                        width: 217.w,
                        height: 297.h,
                      ),
                      horizontalSpacing(30),
                      CustomizeFoodAndSlider(),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpacing(25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Toppings",
                    style: MyStyles.font18RobotoRedBricksSemiBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpacing(20),
                Toppings(),
                verticalSpacing(30),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Side options",
                    style: MyStyles.font18RobotoRedBricksSemiBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                SideOptions(),
              ],
            ),
            verticalSpacing(35),
        
            TotalPrice(
              buttonText: "Add to cart",
              price: widget.product.price,
              onPressed: () {
                context.read<CartCubit>().productId = widget.product.id;
                final selectedItem = OrderItem(
                  productId: context.read<CartCubit>().productId,
                  quantity: context.read<CartCubit>().quantity,
                  spicy: context.read<CartCubit>().spicyLevel,
                  toppings: context.read<CartCubit>().selectedToppings,
                  sideOptions: context.read<CartCubit>().selectedSideOptions,
                  price: double.parse(widget.product.price),
                );
        
                
        
                context.read<CartCubit>().addProduct(selectedItem, {
                  selectedItem.productId: selectedItem.price,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
