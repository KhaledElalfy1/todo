import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_account_name_cubit/change_account_name_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_account_name_cubit/change_account_name_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangeNameDialog extends StatelessWidget {
  const ChangeNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).changeName,
              style: AppFonts.regular18White,
            ),
            Gap(10.h),
            const Divider(
              color: AppColor.lightGrey,
              thickness: 1.5,
            ),
            Gap(16.h),
            Form(
              key: ChangeAccountNameCubit.get(context).globalKey,
              child: CustomTextFormFiled(
                validator: (p0) =>
                    ChangeAccountNameCubit.get(context).validator(p0, context),
                textEditingController:
                    ChangeAccountNameCubit.get(context).nameController,
                hintText: S.of(context).userName,
              ),
            ),
            Gap(28.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      S.of(context).cancel,
                      style: AppFonts.regular16Grey
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocConsumer<ChangeAccountNameCubit,
                      ChangeAccountNameState>(
                    listener: (context, state) {
                      if (state is ChangeAccountNameSuccess) {
                        Navigator.pop(context, 1);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: ChangeAccountNameCubit.get(context)
                            .changeAccountName,
                        child: state is ChangeAccountNameLoading
                            ? const LoadingWidget()
                            : Text(
                                S.of(context).edit,
                                style: AppFonts.regular18White,
                              ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
