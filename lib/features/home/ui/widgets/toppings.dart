import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/home/logic/cubit/toppings_cubit.dart';
import 'package:hungry/features/home/logic/cubit/toppings_state.dart';
import 'package:hungry/features/home/ui/widgets/custom_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Toppings extends StatelessWidget {
  const Toppings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToppingsCubit, ToppingsState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          success: (data) => false,
          orElse: () => true,
        );
        return SizedBox(
          height: 120.h,
          child: Skeletonizer(
            enabled: isLoading,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isLoading
                  ? 4
                  : state.when(
                      initial: () => 0,
                      loading: () => 4,
                      success: (data) => data.length,
                      error: (error) => 0,
                    ),
              itemBuilder: (context, index) {
                bool isSelected = true;
                final toppings = context.read<ToppingsCubit>().toppingList;
                return GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().changeSelectedToppings(
                      toppings[index].id,
                    );
                    isSelected = !isSelected;

                    if (isSelected == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          content: Text("Added ${toppings[index].name}!"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          content: Text("Removed ${toppings[index].name}!"),
                        ),
                      );
                    }
                  },
                  child: CustomCard(
                    isLoading: isLoading,
                    image: state.maybeWhen(
                      success: (data) => toppings[index].image,
                      orElse: () => "https://via.placeholder.com/150",
                    ),
                    cardLabel: state.maybeWhen(
                      success: (data) => toppings[index].name,
                      orElse: () => "null",
                    ),
                    isFirstItem: index == 0 ? true : false,
                    isSelected: isSelected,
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
