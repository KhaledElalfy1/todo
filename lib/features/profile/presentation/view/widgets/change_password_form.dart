import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_visibility_cubit/change_visibility_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_visibility_cubit/change_visibility_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ChangePasswordCubit.get(context).formKey,
      child: Column(
        children: [
          BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityState>(
            builder: (context, state) {
              return CustomTextFormFiled(
                obscureText:
                    ChangeVisibilityCubit.get(context).isOldPasswordVisible,
                suffixIcon: IconButton(
                    onPressed: ChangeVisibilityCubit.get(context)
                        .changeOldPasswordVisibility,
                    icon: ChangeVisibilityCubit.get(context)
                        .oldPasswordVisibility),
                validator: (p0) =>
                    ChangePasswordCubit.get(context).validateTextFiled(p0),
                textEditingController:
                    ChangePasswordCubit.get(context).oldPasswordController,
                hintText: S.of(context).oldPassword,
              );
            },
          ),
          Gap(10.h),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              S.of(context).enterNewPassword,
              style: AppFonts.regular14White,
            ),
          ),
          Gap(10.h),
         BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityState>(
            builder: (context, state) {
              return CustomTextFormFiled(
                obscureText:
                    ChangeVisibilityCubit.get(context).isNewPasswordVisible,
                suffixIcon: IconButton(
                    onPressed: ChangeVisibilityCubit.get(context)
                        .changeNewPasswordVisibility,
                    icon: ChangeVisibilityCubit.get(context)
                        .newPasswordVisibility),
                validator: (p0) =>
                    ChangePasswordCubit.get(context).validateTextFiled(p0),
                textEditingController:
                    ChangePasswordCubit.get(context).newPasswordController,
                hintText: S.of(context).newPassword,
              );
            },
          ),
        ],
      ),
    );
  }
}
