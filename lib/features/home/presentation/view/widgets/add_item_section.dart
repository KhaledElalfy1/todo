import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';

class AddItemSection extends StatelessWidget {
  const AddItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Circle in meddle');
      },
      child: CircleAvatar(
        radius: 35.r,
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
