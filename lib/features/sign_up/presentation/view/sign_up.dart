import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/or_section.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';
import 'package:testfirebase/features/sign_up/presentation/view/widgets/already_have_account.dart';
import 'package:testfirebase/features/sign_up/presentation/view/widgets/sign_up_form.dart';
import 'package:testfirebase/features/sign_up/presentation/view/widgets/social_sign_up_section.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                'Register',
                style: AppFonts.bold32White,
              ),
              Gap(30.h),
              const SignUpForm(),
              Gap(30.h),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        type: 's',
                        title: 'Success!',
                        content: state.sMessage,
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  }
                  if (state is SignUpFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        type: 'Warning',
                        title: 'Warning!',
                        content: state.eMessage,
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (SignUpCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        SignUpCubit.get(context).signUp();
                      }
                    },
                    child: state is SignUpLoading
                        ? const LoadingWidget()
                        : Text(
                            'Register',
                            style: AppFonts.regular20White,
                          ),
                  );
                },
              ),
              Gap(20.h),
              const OrSection(),
              const SocialSignUpSection(),
              Gap(20.h),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
