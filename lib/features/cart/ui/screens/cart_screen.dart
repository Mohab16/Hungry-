import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/core/widgets/total_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightestGrey,
      body: SafeArea(
        child: Column(
          children: [
          
            SizedBox(
              height: 680.h,
              child: ListView.builder(
                itemCount: 6,
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
                                    child: Image.asset(
                                      "assets/images/burger.png",
                                      width: 111.w,
                                      height: 102.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 25.w),
                                    child: Text(
                                      "Hamburger\nVeggie Burger",
                                      style: MyStyles.font16RobotoRedBricksMedium,
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
                                              borderRadius: BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 8.h),
                                            child: Icon(
                                              Icons.minimize_outlined,
                                              size: 20.w,
                                              color: MyColors.lightestGrey,
                                            ),
                                          ),
                                        ),
                                        horizontalSpacing(30),
                                        Text(
                                          "2",
                                          style:
                                              MyStyles.font18RobotoRedBricksMedium,
                                        ),
                                        horizontalSpacing(30),
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
                                              borderRadius: BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
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
                                      padding: EdgeInsets.symmetric(horizontal: 42.w,vertical: 9.5.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                  
                                      ),
                                      backgroundColor: MyColors.darkGreen
                                    ),
                                    onPressed: () {},
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
            ),
            Padding(
              padding:  EdgeInsets.only(top: 40.w),
              child: TotalPrice(buttonText: "Checkout", price: "99.19"),
            )
          ],
        ),
      ),
    );
  }
}
