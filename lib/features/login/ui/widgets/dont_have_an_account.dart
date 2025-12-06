import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: MyStyles.font16RobotoDarkGreenMedium,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(Routes.signupScreen);
                            },
            text: "Signup",
            style: MyStyles.font16RobotoDarkGreenMedium.copyWith(
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.white.withOpacity(0.25)
                )
              ]

            )
          )
        ],
      ),
    );
  }
}
