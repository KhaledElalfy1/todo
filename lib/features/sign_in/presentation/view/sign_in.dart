import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/sign_in/presentation/controller/cubit/sign_in_cubit.dart';
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
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    if (!FirebaseAuth.instance.currentUser!.emailVerified) {
                      showDialog(
                        context: context,
                        builder: (context) => PopupWindow(
                          title: 'Warning',
                          content: 'Please verify your account ',
                          type: 'f',
                          ok: () {
                            context.pop();
                          },
                        ),
                      );
                    } else {
                      context.pushNamedAndRemoveUntil(Routing.home,
                          predicate: (routing) => false);
                    }
                  } else if (state is SignInFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        title: 'Warning',
                        content: state.eMessage,
                        type: 'type',
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
                      if (SignInCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        SignInCubit.get(context).signIn();
                      }
                    },
                    child: state is SignInLoading
                        ? const LoadingWidget()
                        : Text(
                            'Login',
                            style: AppFonts.regular20White,
                          ),
                  );
                },
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
