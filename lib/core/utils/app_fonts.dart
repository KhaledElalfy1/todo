import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testfirebase/core/utils/app_color.dart';

abstract class AppFonts {
  static TextStyle bold32White = GoogleFonts.lato(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );
  static TextStyle regular20White = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );
  static TextStyle regular16Grey = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColor.hitTextColor,
  );
  static TextStyle bold16black = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );
  static TextStyle dialogContent = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );
  static TextStyle dialogTitle = GoogleFonts.lato(
    color: AppColor.green,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
}
