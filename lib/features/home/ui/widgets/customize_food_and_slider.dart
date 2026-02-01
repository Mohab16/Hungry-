import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/cart/logic/cubit/cart_cubit.dart';
import 'package:hungry/features/cart/logic/cubit/cart_state.dart';
import 'package:hungry/features/home/ui/widgets/customize_your_food_text.dart';

class CustomizeFoodAndSlider extends StatefulWidget {
  const CustomizeFoodAndSlider({super.key});

  @override
  State<CustomizeFoodAndSlider> createState() => _CustomizeFoodAndSliderState();
}

class _CustomizeFoodAndSliderState extends State<CustomizeFoodAndSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomizeYourFoodText(),
        verticalSpacing(20),
        Text(
          "Spicy",
          style: MyStyles.font14RobotoRedBricksMedium.copyWith(height: 1.35),
          textAlign: TextAlign.left,
        ),
        verticalSpacing(10),
        SizedBox(
          width: 159.w,
          child: SliderTheme(
            data: SliderThemeData(
              padding: EdgeInsets.zero,
              tickMarkShape: SliderTickMarkShape.noTickMark,
              activeTrackColor: MyColors.darkGreen,
              inactiveTrackColor: MyColors.grey,
              thumbColor: MyColors.darkGreen,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
            ),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final spicy=context.read<CartCubit>().spicyLevel;
                return Slider.adaptive(
                  min: 0,
                  max: 1,
                  divisions: 10,

                  value: spicy,
                  onChanged: (value) {
                    context.read<CartCubit>().changeSpicyLevel(value);
                  },
                );
              },
            ),
          ),
        ),
        verticalSpacing(5),
        Row(
          children: [
            Text(
              "🥶",
              style: MyStyles.font12RobotoWhiteMedium.copyWith(height: 1.35),
            ),
            horizontalSpacing(127),
            Text(
              "🌶️",
              style: MyStyles.font12RobotoWhiteMedium.copyWith(height: 1.35),
            ),
          ],
        ),
      ],
    );
  }
}
