import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/total_price.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/cart/logic/cubit/cart_state.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightestGrey,
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final List allProducts = context
                .read<HomeProductsCubit>()
                .allProducts;
            final List cartItems = context.read<CartCubit>().state.items;
            final Map<int, double> productPrices = {
              for (var product in allProducts)
                product.id: double.parse(product.price),
            };
            if (state.totalPrice == 0 && cartItems.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<CartCubit>().calcTotalPrice(productPrices);
              });
            }

            List findCartProducts() {
              final List cartProducts = [];
              for (var item in cartItems) {
                final product = allProducts.firstWhere(
                  (p) => p.id == item.productId,
                );
                if (product != null) {
                  cartProducts.add(product);
                }
              }
              return cartProducts;
            }

            return Column(
              children: [
                findCartProducts().isEmpty
                    ? SizedBox(
                        height: 680.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/cart_icon.png",
                                color: MyColors.redBricks,
                              ),
                              Text(
                                "Cart is empty",
                                style: MyStyles.font18RobotoRedBricksSemiBold,
                              ),
                            ],
                          ),
                        ),
                      )
                    : _buildCartItemsListView(
                        findCartProducts,
                        cartItems,
                        productPrices,
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 40.w),
                  child: TotalPrice(
                    buttonText: "Checkout",
                    price: state.totalPrice.toString(),
                    onPressed: (){
                      if(cartItems.isNotEmpty){
                      context.pushNamed(Routes.checkoutScreen, arguments: state.totalPrice);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildCartItemsListView(
    List<dynamic> Function() findCartProducts,
    List<dynamic> cartItems,
    productPrices,
  ) {
    return SizedBox(
      height: 680.h,
      child: ListView.builder(
        itemCount: findCartProducts().length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                index == 0 ? verticalSpacing(60) : SizedBox.shrink(),
                Container(
                  width: 386.w,
                  height: 185.h,
                  decoration: BoxDecoration(
                    color: MyColors.lightestGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 12.h),
                            child: Image.network(
                              findCartProducts()[index].image,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              width: 111.w,
                              height: 102.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Text(
                              "${findCartProducts()[index].name.split(" ").first}\n${findCartProducts()[index].name.split(' ').skip(1).join(' ')}",
                              maxLines: 2,
                              style: MyStyles.font16RobotoRedBricksMedium
                                  .copyWith(overflow: TextOverflow.clip),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      horizontalSpacing(80),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                      39.w,
                                      43.h,
                                    ), // بدل fixedSize
                                    padding: EdgeInsets.zero, // مهم جدًا
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: MyColors.darkGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartCubit>()
                                        .decreaseItemQuantity(
                                          index,
                                          productPrices,
                                        );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: Icon(
                                        Icons.minimize_outlined,
                                        size: 20.w,
                                        color: MyColors.lightestGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpacing(18),
                                SizedBox(
                                  width: 30.w,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      " ${cartItems[index].quantity}",
                                      textAlign: TextAlign.center,
                                      style:
                                          MyStyles.font18RobotoRedBricksMedium,
                                    ),
                                  ),
                                ),
                                horizontalSpacing(23),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                      39.w,
                                      43.h,
                                    ), // بدل fixedSize
                                    padding: EdgeInsets.zero, // مهم جدًا
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: MyColors.darkGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartCubit>()
                                        .increaseItemQuantity(
                                          index,
                                          productPrices,
                                        );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 20.w,
                                    color: MyColors.lightestGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpacing(30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 42.w,
                                vertical: 9.5.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: MyColors.darkGreen,
                            ),
                            onPressed: () {
                              context.read<CartCubit>().removeItem(
                                index,
                                productPrices,
                              );
                            },
                            child: Text(
                              "Remove",
                              style: MyStyles.font18RobotoWhiteSemiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpacing(20),
              ],
            ),
          );
        },
      ),
    );
  }
}
