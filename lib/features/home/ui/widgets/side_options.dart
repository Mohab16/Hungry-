import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/home/logic/cubit/side_options_cubit.dart';
import 'package:hungry/features/home/logic/cubit/side_options_state.dart';
import 'package:hungry/features/home/ui/widgets/custom_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SideOptions extends StatelessWidget {
  const SideOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideOptionsCubit, SideOptionsState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          success: (data) => false,
          orElse: () => true,
        );
        return SizedBox(
          height: 140.h,
          child: Skeletonizer(
            enabled: isLoading,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isLoading
                  ? 4
                  : state.when(
                      initial:() => 0,
                      loading:() => 4,
                      success:(data) => data.length,
                      error:(error) => 0,
                    ),
              itemBuilder: (context, index) {
                bool isSelected=true;
                final sideOptions=context.read<SideOptionsCubit>().sideOptionsList;
                return GestureDetector(
                  onTap: () {
                                        context.read<CartCubit>().changeSelectedSideOptions(sideOptions[index].id);
                                        isSelected=!isSelected;

                                         if (isSelected == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          content: Text("Added ${sideOptions[index].name}!"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          content: Text("Removed ${sideOptions[index].name}!"),
                        ),
                      );
                    }

                  },
                  child: CustomCard(
                    isLoading: isLoading,
                    totalCardHeigth: 116.h,
                    image: state.maybeWhen(
                        success:(data) => sideOptions[index].image,
                        orElse: () => "https://via.placeholder.com/150",
                      ),
                    cardLabel: state.maybeWhen(
                        success:(data) => sideOptions[index].name,
                        orElse: () => "null",
                      ),
                    addColor: MyColors.darkGreen,
                    isFirstItem: index == 0 ? true : false, isSelected: isSelected,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
