import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/features/sign_in/presentation/controller/cubit/sign_in_cubit.dart';
import 'package:testfirebase/generated/l10n.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignInCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).email,
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          CustomTextFormFiled(
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                SignInCubit.get(context).emailValidator(value),
            textEditingController: SignInCubit.get(context).emailController,
            hintText: S.of(context).enterEmail,
          ),
          Gap(25.h),
          Text(
            S.of(context).password,
            style: AppFonts.regular20White,
          ),
          Gap(10.h),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return CustomTextFormFiled(
                validator: (value) =>
                    SignInCubit.get(context).passwordValidator(value),
                obscureText: SignInCubit.get(context).isVisable,
                textEditingController:
                    SignInCubit.get(context).passwordController,
                suffixIcon: IconButton(
                  onPressed: SignInCubit.get(context).changeVisibility,
                  icon: SignInCubit.get(context).visibility,
                ),
                hintText: S.of(context).enterPassword,
              );
            },
          ),
          Gap(5.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.pushNamed(Routing.resetPassword);
              },
              child: Text(
                S.of(context).forgetPassword,
                style: AppFonts.regular16Grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
