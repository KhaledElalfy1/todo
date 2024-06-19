import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_visibility_cubit/change_visibility_cubit.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_password_dialog.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/options_row.dart';
import 'package:testfirebase/generated/l10n.dart';


class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: AppIcons.iconsKey,
      title: S.of(context).changePassword,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChangePasswordCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeVisibilityCubit(),
              )
            ],
            child: const ChangePasswordDialog(),
          ),
        );
      },
    );
  }
}
