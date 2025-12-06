import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/core/themes/my_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: MyStyles.font16RobotoWhiteMedium,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(Routes.loginScreen);
                            },
            text: "Login",
            style: MyStyles.font16RobotoWhiteMedium.copyWith(
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
