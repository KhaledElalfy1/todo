import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/generated/l10n.dart';

class CustomTimeDialog extends StatefulWidget {
  const CustomTimeDialog({
    super.key,
  });

  @override
  State<CustomTimeDialog> createState() => _CustomTimeDialogState();
}

class _CustomTimeDialogState extends State<CustomTimeDialog> {
  TextEditingController minutesController = TextEditingController(text: '0');
  TextEditingController secondsController = TextEditingController(text: '0');
  @override
  void dispose() {
    minutesController.dispose();
    secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormFiled(
                    label: Text(S.of(context).minutes),
                    keyboardType: TextInputType.number,
                    hintText: S.of(context).minutes,
                    textEditingController: minutesController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormFiled(
                    label: Text(S.of(context).seconds),
                    keyboardType: TextInputType.number,
                    hintText: S.of(context).seconds,
                    textEditingController: secondsController,
                  ),
                ),
              ],
            ),
            Gap(20.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {minutesController, secondsController});
              },
              child: Text(
                S.of(context).done,
                style: AppFonts.medium20White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
