import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';

class TotalPrice extends StatefulWidget {
  final String buttonText;
  final String price;
  final TextStyle? totalPriceTextStyle;
  final String? label;
  final Function? onPressed;
  final bool isExpanded;
  int? quantity;
  final Function()? onIncrease;
  final Function()? onDecrease;
  TotalPrice({
    super.key,
    required this.buttonText,
    required this.price,
    this.totalPriceTextStyle,
    this.isExpanded = false,
    this.label,
    this.onPressed,
    this.quantity = 0,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
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
                widget.label ?? "Total",
                style: MyStyles.font18RobotoRedBricksSemiBold,
              ),
              verticalSpacing(5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${widget.price} ",
                      style: MyStyles.font32ReemKufiInkDarkGreen,
                    ),
                    TextSpan(
                      text: "LE",
                      style:
                          widget.totalPriceTextStyle ??
                          MyStyles.font32ReemKufiInkBlack,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          widget.quantity! > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(39.w, 43.h), // بدل fixedSize
                        padding: EdgeInsets.zero, // مهم جدًا
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: MyColors.darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        widget.onDecrease!();
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
                          widget.quantity.toString(),
                          textAlign: TextAlign.center,
                          style: MyStyles.font18RobotoRedBricksBold,
                        ),
                      ),
                    ),
                    horizontalSpacing(23),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(39.w, 43.h), // بدل fixedSize
                        padding: EdgeInsets.zero, // مهم جدًا
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: MyColors.darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        widget.onIncrease!();
                      },
                      child: Icon(
                        Icons.add,
                        size: 20.w,
                        color: MyColors.lightestGrey,
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.darkGreen,
                    padding: EdgeInsets.symmetric(
                      vertical: 23.h,
                      horizontal: 47.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    widget.onPressed!();
                  },
                  child: Text(
                    widget.buttonText,
                    style: MyStyles.font18RobotoWhiteSemiBold,
                  ),
                ),
        ],
      ),
    );
  }
}
