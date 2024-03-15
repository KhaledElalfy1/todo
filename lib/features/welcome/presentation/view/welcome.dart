import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              Gap(60.h),
              Text(
                'Welcome to UpTodo',
                style: AppFonts.bold32White,
              ),
              Gap(20.h),
              Text(
                'Please login to your account or create new account to continue',
                textAlign: TextAlign.center,
                style: AppFonts.regular20White,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routing.signIn);
                  },
                  child: Text(
                    'LOGIN',
                    style: AppFonts.regular20White,
                  ),
                ),
              ),
              Gap(20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routing.signUp);
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: AppColor.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'CREATE ACCOUNT',
                    style: AppFonts.regular20White,
                  ),
                ),
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
