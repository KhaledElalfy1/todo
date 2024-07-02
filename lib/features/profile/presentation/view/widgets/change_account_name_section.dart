import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/options_row.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangeAccountNameSection extends StatelessWidget {
  const ChangeAccountNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: AppIcons.iconsUser,
      title: S.of(context).changeName,
      onTap: () {},
    );
  }
}
