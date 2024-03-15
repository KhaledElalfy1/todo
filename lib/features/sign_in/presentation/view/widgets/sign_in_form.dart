import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // TODO add form key
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-mail',
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          CustomTextFormFiled(
            textEditingController: TextEditingController(),
            hintText: 'Enter your e-mail',
          ),
          Gap(25.h),
          Text(
            'Password',
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          CustomTextFormFiled(
            obscureText: true,
            textEditingController: TextEditingController(),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility),
            ),
            hintText: 'Enter your Password',
          ),
          Gap(5.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'forget Password?',
                style: AppFonts.regular16Grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
