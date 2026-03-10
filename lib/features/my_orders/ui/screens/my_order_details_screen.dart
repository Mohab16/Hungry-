import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/features/my_orders/data/models/my_order_details_response_model.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_order_details_cubit.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_order_details_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyOrderDetailsScreen extends StatefulWidget {
  final String id;
  const MyOrderDetailsScreen({super.key, required this.id});

  @override
  State<MyOrderDetailsScreen> createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyOrderDetailsCubit>().emitOrderDetails(widget.id);
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
                    child: CustomBackButton(),
                  ),
                  verticalSpacing(10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Order Details",
                      style: MyStyles.font35LuckiestGuyDarkGreenRegular,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<MyOrderDetailsCubit, MyOrderDetailsState>(
                builder: (context, state) {
                  final dummyTopping = Toppings(
                    name: 'Loading',
                    image:
                        'http://sonic-zdi0.onrender.com/storage/toppings/pickles.png',
                  );
                  final dummySide = SideOptions(
                    name: 'Loading',
                    image:
                        'http://sonic-zdi0.onrender.com/storage/toppings/pickles.png',
                  );
                  final dummy = Items(
                    name: 'Loading...',
                    image:
                        'http://sonic-zdi0.onrender.com/storage/toppings/pickles.png',
                    quantity: 0,
                    price: '0',
                    toppings: [dummyTopping],
                    sideOptions: [dummySide],
                  );
                  final orderItems = state.when(
                    initial: () => [dummy, dummy],
                    loading: () => [dummy, dummy],
                    success: (data) => data.data.items,
                    error: (error) => [dummy, dummy],
                  );

                  final bool isLoading = state.maybeWhen(
                    success: (data) => false,
                    orElse: () => true,
                  );
                  return Skeletonizer(
                    enabled: isLoading,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 20.h),
                      scrollDirection: Axis.vertical,
                      itemCount: state.when(
                        initial: () => 2,
                        loading: () => 2,
                        success: (data) => orderItems.length,
                        error: (error) => 1,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            verticalSpacing(10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                padding: EdgeInsets.all(10),

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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: SizedBox(
                                            width: 90.w,
                                            height: 90.h,
                                            child: isLoading
                                                ? Container(
                                                    width: 90.w,
                                                    height: 90.h,
                                                    color: MyColors.lightGrey,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        orderItems[index].image,
                                                    fit: BoxFit.contain,
                                                  ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            verticalSpacing(10),
                                            Text(
                                              orderItems[index].name,
                                              overflow: TextOverflow.clip,
                                              style: MyStyles
                                                  .font18RobotoRedBricksSemiBold,
                                            ),
                                            Text(
                                              "Quantity: ${orderItems[index].quantity}",
                                              style: MyStyles
                                                  .font18RobotoRedBricksSemiBold,
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "Price: ${orderItems[index].price}",
                                              style: MyStyles
                                                  .font18RobotoRedBricksSemiBold,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    verticalSpacing(15),
                                    Text(
                                      "Toppings",
                                      style: MyStyles
                                          .font20LuckiestGuyRedBricksRegular,
                                      textAlign: TextAlign.left,
                                    ),
                                    verticalSpacing(15),
                                    SizedBox(
                                      height: 50.h,
                                      child: ListView.builder(
                                        itemCount:
                                            orderItems[index].toppings.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, toppingIndex) {
                                          final topping =
                                              orderItems[index].toppings;

                                          ///Todo handle empty toppings and side options

                                          return topping.length == 0
                                              ? Icon(Icons.abc)
                                              : Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      child: SizedBox(
                                                        width: 50.w,
                                                        height: 50.h,
                                                        child: isLoading
                                                            ? Container(
                                                                width: 50.w,
                                                                height: 50.h,
                                                                color: MyColors
                                                                    .lightGrey,
                                                              )
                                                            : CachedNetworkImage(
                                                                imageUrl:
                                                                    topping[toppingIndex]
                                                                        .image,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                      ),
                                                    ),
                                                    horizontalSpacing(5),
                                                  ],
                                                );
                                        },
                                      ),
                                    ),
                                    verticalSpacing(15),
                                    Text(
                                      "Side options",
                                      style: MyStyles
                                          .font20LuckiestGuyRedBricksRegular,
                                      textAlign: TextAlign.left,
                                    ),
                                    verticalSpacing(15),
                                    SizedBox(
                                      height: 50.h,
                                      child: ListView.builder(
                                        itemCount: orderItems[index]
                                            .sideOptions!
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, sideIndex) {
                                          final sideOptions =
                                              orderItems[index].sideOptions;
                                          return Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: SizedBox(
                                                  width: 50.w,
                                                  height: 50.h,
                                                  child: isLoading
                                                      ? Container(
                                                          width: 50.w,
                                                          height: 50.h,
                                                          color: MyColors
                                                              .lightGrey,
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl:
                                                              sideOptions[sideIndex]
                                                                  .image,
                                                          fit: BoxFit.contain,
                                                        ),
                                                ),
                                              ),
                                              horizontalSpacing(5),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpacing(20),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
