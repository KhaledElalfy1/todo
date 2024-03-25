import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskName,
    required this.timestamp,
  });
  final String taskName;
  final Timestamp timestamp;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.hitTextColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                taskName,
                style: AppFonts.dialogContent,
              ),
              Text(
                timestamp.toString().substring(0, 10),
                style: AppFonts.regular12White.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
