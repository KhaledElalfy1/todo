import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_cubit.dart';

class ChangeLanguageSection extends StatelessWidget {
  const ChangeLanguageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width - 32.w,
      leadingIcon: const Icon(
        Icons.language_sharp,
        size: 35,
      ),
      initialSelection: ChangeLanguageCubit.get(context).currentLan,
      dropdownMenuEntries: ChangeLanguageCubit.get(context)
          .languages
          .keys
          .map(
            (e) => DropdownMenuEntry(
              value: e,
              label: e,
            ),
          )
          .toList(),
      onSelected: (String? value) {
        ChangeLanguageCubit.get(context).changeLanguageFromMenu(value!);
      },
    );
  }
}
