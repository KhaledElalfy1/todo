import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/core/widgets/social_sign_in.dart';
import 'package:testfirebase/features/sign_in/presentation/controller/cubit/sign_in_cubit.dart';

class SocialSignInSection extends StatelessWidget {
  const SocialSignInSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is GoogleSignInSuccess) {
              context.pushReplacementNamed(Routing.home);
            } else if (state is GoogleSignInFailure) {
              PopupWindow(
                title: 'Failure!',
                content: state.eMessage,
                type: 'e',
                ok: () => context.pop(),
              );
            }
          },
          builder: (context, state) {
            return SocialSignIn(
              onPressed: SignInCubit.get(context).googleSignIn,
              iconPath: 'assets/icons/google.svg',
              text: 'Login with Google',
            );
          },
        ),
        Gap(10.h),
        SocialSignIn(
          onPressed: () {
            if (Platform.isAndroid) {
              showDialog(
                context: context,
                builder: (context) => PopupWindow(
                  title: 'Failure!',
                  content: 'You are poor android user!!!!',
                  type: 'f',
                  ok: () => context.pop(),
                ),
              );
            }
          },
          iconPath: 'assets/icons/apple.svg',
          text: 'Login with Apple',
        ),
      ],
    );
  }
}
