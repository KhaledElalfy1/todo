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
}
