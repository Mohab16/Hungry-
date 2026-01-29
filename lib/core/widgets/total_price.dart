import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';

class TotalPrice extends StatelessWidget {
  final String buttonText;
  final String price;
  final TextStyle? totalPriceTextStyle;
  final String? label;
  final Function? onPressed;
  const TotalPrice({super.key, required this.buttonText, required this.price, this.totalPriceTextStyle, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label?? "Total",
                        style: MyStyles.font18RobotoRedBricksSemiBold,
                      ),
                      verticalSpacing(5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$price ",
                              style: MyStyles.font32ReemKufiInkDarkGreen,
                            ),
                            TextSpan(
                              text: "LE",
                              style: totalPriceTextStyle?? MyStyles.font32ReemKufiInkBlack,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.darkGreen,
                      padding: EdgeInsets.symmetric(vertical: 23.h,horizontal: 47.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                    onPressed: () {
                     onPressed!();
                    }, child: Text(buttonText,style: MyStyles.font18RobotoWhiteSemiBold,)
                    ),
                ],
              ),
            );
  }
}