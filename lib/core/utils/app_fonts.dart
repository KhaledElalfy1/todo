import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testfirebase/core/utils/app_color.dart';

abstract class AppFonts {
  static TextStyle bold32White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(32),
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle regular20White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(20),
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );

  static TextStyle medium20White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(20),
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle regular12White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(12),
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );

  static TextStyle regular14White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(14),
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );

  static TextStyle regular18White = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(18),
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );

  static TextStyle regular16Grey = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(16),
    fontWeight: FontWeight.normal,
    color: AppColor.hitTextColor,
  );

  static TextStyle bold16black = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(16),
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );

  static TextStyle dialogContent = GoogleFonts.lato(
    fontSize: getResponsiveFontSize(16),
    fontWeight: FontWeight.normal,
    color: AppColor.white,
  );

  static TextStyle dialogTitle = GoogleFonts.lato(
    color: AppColor.green,
    fontSize: getResponsiveFontSize(20),
    fontWeight: FontWeight.bold,
  );
}

double getResponsiveFontSize(double fontSize) {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double currentWidth = physicalWidth / devicePixelRatio;
  double responsiveFont =
      fontSize * getCurrentPlatformRatio(currentWidth: currentWidth);
  double lowerLimit = responsiveFont * .8;
  double upperLimit = responsiveFont * 1.2;
  return responsiveFont.clamp(lowerLimit, upperLimit);
}

double getCurrentPlatformRatio({required double currentWidth}) {
  if (currentWidth < 800) {
    return currentWidth / 380;
  } else if (currentWidth < 1200) {
    return currentWidth / 800;
  } else {
    return currentWidth / 1920;
  }
}
