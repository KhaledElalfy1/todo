import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/core/widgets/social_sign_in.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';
import 'package:testfirebase/generated/l10n.dart';

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
            if (state is GoogleSignUpSuccess &&
                FirebaseAuth.instance.currentUser!.displayName != null) {
              context.pushReplacementNamed(Routing.home);
            } else if (state is GoogleSignUpSuccess &&
                FirebaseAuth.instance.currentUser!.displayName == null) {
              context.pushReplacementNamed(Routing.userDetails);
            } else if (state is GoogleSignUpFailure) {
              showDialog(
                context: context,
                builder: (context) => PopupWindow(
                  title: S.of(context).failure,
                  content: state.eMessage,
                  type: 'f',
                  ok: () => context.pop(),
                ),
              );
            }
          },
          builder: (context, state) {
            return SocialSignIn(
              onPressed: SignUpCubit.get(context).googleSignUp,
              iconPath: AppIcons.iconsGoogle,
              text: S.of(context).registerWithGoogle,
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
                  title: S.of(context).warning,
                  content: S.of(context).poorAndroid,
                  type: 'f',
                  ok: () => context.pop(),
                ),
              );
            }
          },
          iconPath: AppIcons.iconsApple,
          text: S.of(context).registerWithApple,
        ),
      ],
    );
  }
}
