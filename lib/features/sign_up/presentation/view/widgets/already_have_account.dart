import 'package:flutter/material.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routing.signIn);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: AppFonts.regular16Grey.copyWith(
                fontSize: 13,
              ),
            ),
            TextSpan(
              text: 'SignIn',
              style: AppFonts.regular20White.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
