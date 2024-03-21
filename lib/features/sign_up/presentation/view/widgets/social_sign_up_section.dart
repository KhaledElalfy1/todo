import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/widgets/social_sign_in.dart';

class SocialSignUpSection extends StatelessWidget {
  const SocialSignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialSignIn(
          onPressed: () {},
          iconPath: 'assets/icons/google.svg',
          text: 'Register with Google',
        ),
        Gap(10.h),
        SocialSignIn(
          onPressed: () {},
          iconPath: 'assets/icons/apple.svg',
          text: 'Register with Apple',
        ),
      ],
    );
  }
}
