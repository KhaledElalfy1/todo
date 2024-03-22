import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size(90, 56)),
        backgroundColor: const MaterialStatePropertyAll(AppColor.primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppFonts.regular16Grey,
      border: borderDecoration(),
      enabledBorder: borderDecoration(),
      errorBorder: borderDecoration(color: AppColor.red),
      focusedBorder: borderDecoration(),
      focusedErrorBorder: borderDecoration(),
    ),
  );
}

OutlineInputBorder borderDecoration({Color color = AppColor.lightGrey}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
