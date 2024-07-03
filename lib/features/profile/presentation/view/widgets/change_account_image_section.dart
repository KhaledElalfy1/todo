import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/options_row.dart';
import 'package:testfirebase/features/user_details/presentation/view/widgets/bottom_sheet_body.dart';
import 'package:testfirebase/generated/l10n.dart';

import '../../../../user_details/presentation/controller/pick_image_cubit/pick_image_cubit.dart';

class ChangeAccountImageSection extends StatelessWidget {
  const ChangeAccountImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: AppIcons.iconsCamera,
      title: S.of(context).changeImage,
      onTap: () {
        showModalBottomSheet(
          sheetAnimationStyle: AnimationStyle(
            duration: const Duration(
              milliseconds: 600,
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => PickImageCubit(),
              child: const BottomSheetBody(),
            );
          },
        ).then(
          (value) {
            if (value != null) {
              UpdateNewImageCubit.get(context)
                  .updateUserPicture(userImage: value);
            }
          },
        );
      },
    );
  }
}
