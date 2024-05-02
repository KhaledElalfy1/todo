import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_password_cubit/change_password_state.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_password_form.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).changeAccountPassword,
              style: AppFonts.dialogContent,
            ),
            const Divider(
              thickness: 2,
            ),
            Gap(10.h),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                S.of(context).enterOldPassword,
                style: AppFonts.regular14White,
              ),
            ),
            Gap(10.h),
            const ChangePasswordForm(),
            Gap(25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      S.of(context).cancel,
                      style: AppFonts.bold16black
                          .copyWith(color: AppColor.primaryColor, fontSize: 18),
                    )),
                ElevatedButton(
                    onPressed: () {
                      if (ChangePasswordCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        FocusScope.of(context).unfocus();
                        ChangePasswordCubit.get(context)
                            .reauthenticateAndChangePassword();
                      }
                    },
                    child:
                        BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                      listener: (context, state) {
                        if (state is ChangePasswordSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) => PopupWindow(
                              title: S.of(context).success,
                              content:
                                  S.of(context).passwordChangedSuccessfully,
                              type: 's',
                              ok: () => context.pop(),
                            ),
                          );
                        } else if (state is ChangePasswordFailure) {
                          showDialog(
                            context: context,
                            builder: (context) => PopupWindow(
                              title: S.of(context).failure,
                              content: S.of(context).passwordChangedFailure,
                              type: 'f',
                              ok: () => context.pop(),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is ChangePasswordLoading
                            ? const LoadingWidget()
                            : Text(
                                S.of(context).edit,
                                style: AppFonts.bold16black.copyWith(
                                    color: AppColor.white, fontSize: 18),
                              );
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
