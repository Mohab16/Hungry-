import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/logic/cubit/home_products_state.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({super.key});

  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return BlocBuilder<HomeProductsCubit, HomeProductsState>(
      builder: (context, state) {
        final categories = context
            .read<HomeProductsCubit>()
            .categoryMap
            .keys
            .toList();
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              isSelected =
                  context.read<HomeProductsCubit>().selectedCategory ==
                  categories[index];

              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeProductsCubit>().filterProducts(
                      categories[index],
                      null,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color:isSelected? MyColors.darkGreen:MyColors.mediumGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style:isSelected? MyStyles.font16RobotoWhiteMedium:MyStyles.font16RobotoDarkGreyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
