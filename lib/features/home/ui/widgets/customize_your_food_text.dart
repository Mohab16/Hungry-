import 'package:flutter/material.dart';
import 'package:hungry/core/themes/my_styles.dart';

class CustomizeYourFoodText extends StatelessWidget {
  const CustomizeYourFoodText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Customize ",
            style: MyStyles.font16RobotoRedBricksBold
                .copyWith(height: 1.8),
          ),
          TextSpan(
            text:
                "Your Food\nto Your Tastes. Ultimate\nExperience",
            style: MyStyles.font14RobotoRedBricksRegular
                .copyWith(height: 1.8),
          ),
        ],
      ),
    );
  }
}
