import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/generated/l10n.dart';


class SignOutSection extends StatelessWidget {
  const SignOutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            context.pushNamedAndRemoveUntil(Routing.welcomeScreen,
                predicate: (routing) => false);
          },
          icon: SvgPicture.asset(AppIcons.iconsLogOut),
        ),
        Text(
          S.of(context).logout,
          style: AppFonts.medium20White.copyWith(color: AppColor.red),
        )
      ],
    );
  }
}
