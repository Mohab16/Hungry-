import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/core/widgets/custom_back_button.dart';
import 'package:hungry/core/widgets/total_price.dart';
import 'package:hungry/features/home/ui/widgets/custom_card.dart';
import 'package:hungry/features/home/ui/widgets/customize_your_food_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double spicyLevel = 0.5;
  List toppingImages = [
    "assets/images/tomato.png",
    "assets/images/onion.png",
    "assets/images/kheyar.png",
    "assets/images/bacon.png",
  ];

  List toppings = ["Tomato", "Onions", "Pickles", "Bacons"];

  List sideOptions = ["Fries", "Coleslaw", "Salad", "Onion"];

  List sideOptionsImages = [
    "assets/images/fries.png",
    "assets/images/coleslaw.png",
    "assets/images/salad.png",
    "assets/images/fried_onion.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: MyColors.lightestGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CustomBackButton(),
            verticalSpacing(2),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/burger_details.png",
                      width: 217.w,
                      height: 297.h,
                    ),
                    horizontalSpacing(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizeYourFoodText(),
                        verticalSpacing(20),
                        Text(
                          "Spicy",
                          style: MyStyles.font14RobotoRedBricksMedium.copyWith(
                            height: 1.35,
                          ),
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
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 20,
                              ),
                            ),
                            child: Slider.adaptive(
                              min: 0,
                              max: 1,
                              divisions: 10,

                              value: spicyLevel,
                              onChanged: (value) {
                                setState(() {
                                  spicyLevel = value.toDouble();
                                  print(spicyLevel);
                                });
                              },
                            ),
                          ),
                        ),
                        verticalSpacing(5),
                        Row(
                          children: [
                            Text(
                              "🥶",
                              style: MyStyles.font12RobotoWhiteMedium.copyWith(
                                height: 1.35,
                              ),
                            ),
                            horizontalSpacing(127),
                            Text(
                              "🌶️",
                              style: MyStyles.font12RobotoWhiteMedium.copyWith(
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacing(50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Toppings",
                    style: MyStyles.font18RobotoRedBricksSemiBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpacing(20),
                SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: toppingImages.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        image: toppingImages[index],
                        cardLabel: toppings[index],
                        isFirstItem: index == 0 ? true : false,
                      );
                    },
                  ),
                ),
                verticalSpacing(30),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Side options",
                    style: MyStyles.font18RobotoRedBricksSemiBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 140.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sideOptions.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        totalCardHeigth: 116.h,
                        image: sideOptionsImages[index],
                        cardLabel: sideOptions[index],
                        addColor: MyColors.darkGreen,
                        isFirstItem: index == 0 ? true : false,
                      );
                    },
                  ),
                ),
              ],
            ),
            verticalSpacing(35),

            TotalPrice(buttonText: "Add to cart", price: "18.19",)
          ],
        ),
      ),
    );
  }
}
