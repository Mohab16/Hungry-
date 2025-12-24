import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/themes/my_styles.dart';

class ProductItem extends StatelessWidget {
  final dynamic product;
  const ProductItem({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            Center(
              child:product==null? Image.asset(
                "assets/images/burger.png",
                width: 100.w,
                height: 100.h,
                fit: BoxFit.contain,
              ): 
              Image.network(
                product.image,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.contain,
              )
            ),
    
            Spacer(), // ✅ بدل verticalSpacing ثابت
            // الاسم
           product==null? Text(
              "Cheeseburger",
              style: MyStyles.font16RobotoRedBricksSemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ):
            Text(
              product.name,
              style: MyStyles.font16RobotoRedBricksSemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
    
            SizedBox(height: 4.h),
    
            // الوصف
            product==null? Text(
              "Wendy's Burger",
              style: MyStyles.font16RobotoRedBricksRegular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ):
            Text(
              "${product.price} LE",
              style: MyStyles.font16RobotoRedBricksRegular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
    
            SizedBox(height: 8.h),
    
            // التقييم
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16.sp),
                SizedBox(width: 4.w),
               product==null? Text(
                  "4.9",
                  style: MyStyles.font16RobotoRedBricksSemiBold,
                ):
                Text(
                  product.rating,
                  style: MyStyles.font16RobotoRedBricksSemiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}