import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class PopupWindow extends StatelessWidget {
  const PopupWindow({
    super.key,
    required this.title,
    required this.content,
    this.ok,
    this.cancel, required this.type,
  });
  final String title, content,type;
  final VoidCallback? ok, cancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.white,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style:type=='s'? AppFonts.dialogTitle:AppFonts.dialogTitle.copyWith(color: AppColor.red),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: AppFonts.dialogContent,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: ok,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.green,
              ),
              child: Text(
                'OK',
                style: AppFonts.bold16black,
              ),
            ),
            Gap(20.w),
            cancel != null
                ? ElevatedButton(
                    onPressed: cancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.red,
                    ),
                    child: Text(
                      'Cancel',
                      style: AppFonts.bold16black,
                    ),
                  )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
