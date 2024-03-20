import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/reset_password/presentation/controller/cubit/reset_password_cubit.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: AppFonts.bold32White,
              ),
              Gap(40.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: AppFonts.regular20White,
                ),
              ),
              Gap(10.h),
              Form(
                key: ResetPasswordCubit.get(context).formKey,
                child: CustomTextFormFiled(
                  validator: (value) =>
                      ResetPasswordCubit.get(context).emailValidator(value),
                  textEditingController:
                      ResetPasswordCubit.get(context).emailController,
                  hintText: 'Enter your Email',
                ),
              ),
              const Spacer(),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        title: 'Success!',
                        content: state.sMessage,
                        type: 's',
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  } else if (state is ResetPasswordFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        title: 'Failure!',
                        content: state.eMessage,
                        type: 'f',
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (ResetPasswordCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          ResetPasswordCubit.get(context).resetPassword();
                        }
                      },
                      child: state is ResetPasswordLoading
                          ? const LoadingWidget()
                          : Text(
                              'Send Code',
                              style: AppFonts.regular20White,
                            ),
                    ),
                  );
                },
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
