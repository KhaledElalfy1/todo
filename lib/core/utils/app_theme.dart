import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize:const MaterialStatePropertyAll( Size(90, 48)),
          backgroundColor:
              const MaterialStatePropertyAll(AppColor.primaryColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ));
}
