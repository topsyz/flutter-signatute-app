import 'package:flutter/material.dart';
import 'package:signio/SCREENS/sign_in/sign_in_screen.dart';

import '../constants.dart';

class AlreadyMemberText extends StatelessWidget {
  const AlreadyMemberText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already yet a member ? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
          child: const Text(
            "sign In here",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
