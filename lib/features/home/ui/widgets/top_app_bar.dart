import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/logic/cubit/home_products_state.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  Widget helloText(String name) {
    return Text(
      "Hello, $name",
      style: MyStyles.font18PoppinsDarkGreyMedium.copyWith(height: 0.1),
    );
  }

  Widget userImage(imageUrl) {
    return CachedNetworkImage(
      imageUrl:  imageUrl,
      width: 60.w,
      height: 60.h,

      errorWidget: (context, error, stackTrace) {
        return CachedNetworkImage(imageUrl:  imageUrl, width: 60.w, height: 60.h);
      },
      progressIndicatorBuilder: (context, child, loadingProgress) {
        return CachedNetworkImage(imageUrl:  imageUrl, width: 60.w, height: 60.h);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductsCubit, HomeProductsState>(
      builder: (context, state) {
        var children = [
          verticalSpacing(30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hungry?",
                style: MyStyles.font50LuckiestGuyDarkGreenRegular,
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: userImage(
                  "https://tse4.mm.bing.net/th/id/OIP.hGSCbXlcOjL_9mmzerqAbQHaHa?pid=Api&P=0&h=220",
                ),
              ),
            ],
          ),
          state.when(
            initial: () => helloText(""),
            loading: () => helloText(""),
            success: (data) =>
                helloText(context.read<HomeProductsCubit>().userName!),
            error: (error) => helloText(""),
          ),
          verticalSpacing(30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: context.read<HomeProductsCubit>().searchController,
              onChanged: (value) {
                context.read<HomeProductsCubit>().filterProducts(null, value);
              },
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 10.h),
                  child: Image.asset(
                    "assets/images/search_icon.png",
                    color: MyColors.redBricks,
                    height: 28.h,
                    width: 28.w,
                  ),
                ),
                hintText: "Search",
                hintStyle: MyStyles.font18RobotoRedBricksMedium,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );
      },
    );
  }
}
