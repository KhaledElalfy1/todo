import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/dont_have_account_section.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/or_section.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/sign_in_form.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/social_sign_in_section.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Login',
                style: AppFonts.bold32White,
              ),
              Gap(50.h),
              const SignInForm(),
              Gap(50.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: AppFonts.regular20White,
                ),
              ),
              Gap(20.h),
              const OrSection(),
              const SocialSignInSection(),
              Gap(20.h),
              const DontHaveAccountSection(),
              
            ],
          ),
        ),
      ),
    );
  }
}
