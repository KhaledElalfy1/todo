import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_cubit.dart';
import 'package:testfirebase/core/service/service_locator.dart';

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
      initialSelection: getIt<CacheHelper>().getCurrentLanguage()??"English",
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
