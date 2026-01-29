import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';

class CustomCard extends StatelessWidget {
  final double? totalCardHeigth;
  final String? image;
  final String? cardLabel;
  final bool isFirstItem;
  final Color? addColor;
  final bool isSelected;
  const CustomCard({
    super.key,
    this.totalCardHeigth,
    required this.image,
    required this.cardLabel,
    required this.isFirstItem,
    this.addColor, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isFirstItem ? horizontalSpacing(10) : SizedBox.shrink(),
        Stack(
          children: [
            Container(
              height: totalCardHeigth ?? 99.h,
              width: 84.w,
              decoration: BoxDecoration(
                color: MyColors.redBricks,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, bottom: 13.h),
                        child: cardLabel != null
                            ? Text(
                                cardLabel!,
                                style: MyStyles.font12RobotoWhiteMedium,
                              )
                            : Container(
                                width: 40,
                                height: 10,
                                color: Colors.grey.shade300,
                              ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 13.h, right: 5.w),
                        child: CircleAvatar(
                          radius: 8.h,
                          backgroundColor: addColor ?? MyColors.red,
                          child: Center(
                            child: Image.asset(
                              "assets/images/plus_icon.png",
                              width: 8.w,
                              height: 8.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                height: totalCardHeigth == null ? 61.h : 78.h,
                width: 84.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:image==null? Container(
                      width: 55.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                    ): Image.network(
                      image!,
                      loadingBuilder: (context, child, loadingProgress) {
                        if(loadingProgress==null) return child;
                        return Container(
                          width: 55.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 55.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        horizontalSpacing(25),
      ],
    );
  }
}
