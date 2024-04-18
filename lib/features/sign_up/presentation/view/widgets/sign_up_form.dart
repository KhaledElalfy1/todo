import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';
import 'package:testfirebase/generated/l10n.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).email,
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          CustomTextFormFiled(
            validator: (value) =>
                SignUpCubit.get(context).emailValidator(value),
            textEditingController: SignUpCubit.get(context).emailController,
            hintText: S.of(context).enterEmail,
          ),
          Gap(15.h),
          Text(
            S.of(context).password,
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomTextFormFiled(
                validator: (value) =>
                    SignUpCubit.get(context).passwordValidator(value),
                obscureText: SignUpCubit.get(context).isPasswordVisible,
                textEditingController:
                    SignUpCubit.get(context).passwordController,
                suffixIcon: IconButton(
                  onPressed: SignUpCubit.get(context).changePasswordVisibility,
                  icon: SignUpCubit.get(context).passwordVisibility,
                ),
                hintText: S.of(context).enterPassword,
              );
            },
          ),
          Gap(15.h),
          Text(
            S.of(context).confirmPassword,
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomTextFormFiled(
                validator: (value) =>
                    SignUpCubit.get(context).confirmPasswordValidator(value),
                obscureText: SignUpCubit.get(context).isConfirmPasswordVisible,
                textEditingController:
                    SignUpCubit.get(context).confirmPasswordController,
                suffixIcon: IconButton(
                  onPressed:
                      SignUpCubit.get(context).changeConfirmPasswordVisibility,
                  icon: SignUpCubit.get(context).confirmPasswordVisibility,
                ),
                hintText: S.of(context).confirmYourPassword,
              );
            },
          ),
        ],
      ),
    );
  }
}
