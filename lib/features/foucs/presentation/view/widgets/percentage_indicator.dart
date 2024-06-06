import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class CustomPercentageIndicator extends StatelessWidget {
  const CustomPercentageIndicator({
    super.key,
    required this.finalValue,
    required this.counter,
  });

  final int finalValue, counter;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: (213 / 2).r,
      lineWidth: 15,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColor.primaryColor,
      animateFromLastPercent: true,
      percent: counter / finalValue,
      center: Text(
        '${(counter ~/ 60).toString().padLeft(2, '0')}:${(counter % 60).toString().padLeft(2, '0')}',
        style: AppFonts.medium20White.copyWith(fontSize: 40),
      ),
    );
  }
}
