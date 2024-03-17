import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/or_section.dart';
import 'package:testfirebase/features/sign_in/presentation/view/widgets/social_sign_in_section.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';
import 'package:testfirebase/features/sign_up/presentation/view/widgets/already_have_account.dart';
import 'package:testfirebase/features/sign_up/presentation/view/widgets/sign_up_form.dart';

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
                    getIt<Logger>().i('Success Login');
                  }
                  if (state is SignUpFailure) {
                     getIt<Logger>().w(state.eMessage);
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
              const SocialSignInSection(),
              Gap(20.h),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
