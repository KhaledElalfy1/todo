import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/core/widgets/social_sign_in.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';

class SocialSignUpSection extends StatelessWidget {
  const SocialSignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is GoogleSignUpSuccess) {
              debugPrint('Success');
            } else if (state is GoogleSignUpFailure) {
              PopupWindow(
                title: 'Failure!',
                content: state.eMessage,
                type: 'f',
                ok: () => context.pop(),
              );
            }
          },
          builder: (context, state) {
            return SocialSignIn(
              onPressed: SignUpCubit.get(context).googleSignUp,
              iconPath: 'assets/icons/google.svg',
              text: 'Register with Google',
            );
          },
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
