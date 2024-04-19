import 'package:flutter/material.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/generated/l10n.dart';

class DontHaveAccountSection extends StatelessWidget {
  const DontHaveAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routing.signUp);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: S.of(context).dontHaveAccount,
              style: AppFonts.regular16Grey.copyWith(
                fontSize: 13,
              ),
            ),
            TextSpan(
              text: S.of(context).register,
              style: AppFonts.regular20White.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
