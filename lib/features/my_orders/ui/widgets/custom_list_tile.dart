import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';

class CustomListTile extends StatelessWidget {
  final String imageUrl;
  final String createdAt;
  final String totalPrice;
  final bool isLoading;
  const CustomListTile({
    super.key,
    required this.imageUrl,
    required this.createdAt,
    required this.totalPrice,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(15),
          Container(
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
            child: Row(
              children: [
                // horizontalSpacing(10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: 90.w,
                    height: 90.h,
                    child: isLoading
                        ? Container(
                          width: 90.w,
                           height: 90.h,
                           color: MyColors.lightGrey,
                          )
                        : Image.network(imageUrl),
                  ),
                ),
                horizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          convert24to12(createdAt),
                          style: MyStyles.font16RobotoRedBricksSemiBold,
                        ),
                        horizontalSpacing(30),
                        Text(
                          "Confirmed",
                          style: MyStyles.font18RobotoDarkGreenSemiBold,
                        ),
                      ],
                    ),
                    Text(
                      "Total price: $totalPrice",
                      style: MyStyles.font16RobotoRedBricksSemiBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }
}

String convert24to12(String dateTimeStr) {
  // parse التاريخ
  DateTime dt = DateTime.parse(dateTimeStr);

  // اليوم والشهر والسنة
  String day = dt.day.toString().padLeft(2, '0');
  String month = dt.month.toString().padLeft(2, '0');
  String year = dt.year.toString();

  // الساعة والدقيقة بصيغة 12 ساعة
  int hour = dt.hour;
  int minute = dt.minute;

  String period = hour >= 12 ? 'PM' : 'AM';
  int hour12 = hour % 12;
  if (hour12 == 0) hour12 = 12;

  String minuteStr = minute.toString().padLeft(2, '0');

  return '$day-$month-$year $hour12:$minuteStr $period';
}
