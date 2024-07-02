import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/user_details/presentation/controller/pick_image_cubit/pick_image_cubit.dart';
import 'package:testfirebase/features/user_details/presentation/controller/update_user_name_cubit/update_user_details_cubit.dart';
import 'package:testfirebase/features/user_details/presentation/controller/update_user_name_cubit/update_user_details_state.dart';
import 'package:testfirebase/features/user_details/presentation/view/widgets/bottom_sheet_body.dart';
import 'package:testfirebase/features/user_details/presentation/view/widgets/pick_profile_picture.dart';
import 'package:testfirebase/generated/l10n.dart';

import '../controller/show_chosen_cubit/show_chosen_image_cubit.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Gap(30.h),
            PickUserProfilePicture(
              onPressed: () {
                showModalBottomSheet(
                  sheetAnimationStyle: AnimationStyle(
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return BlocProvider(
                      create: (context) => PickImageCubit(),
                      child: const BottomSheetBody(),
                    );
                  },
                ).then(
                  (value) {
                    if (value != null) {
                      ShowChosenImageCubit.get(context).viewImage(value);
                      UpdateUserDetailsCubit.get(context).userImage = value;
                    }
                  },
                );
              },
            ),
            Gap(30.h),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                S.of(context).userName,
                style: AppFonts.regular20White,
              ),
            ),
            Gap(8.h),
            Form(
              key: UpdateUserDetailsCubit.get(context).globalKey,
              child: CustomTextFormFiled(
                validator: (p0) =>
                    UpdateUserDetailsCubit.get(context).validator(p0),
                textEditingController:
                    UpdateUserDetailsCubit.get(context).userNameController,
                hintText: S.of(context).userName,
              ),
            ),
            Gap(60.h),
            SizedBox(
              width: double.infinity,
              child:
                  BlocConsumer<UpdateUserDetailsCubit, UpdateUserDetailsState>(
                listener: (context, state) {
                  if (state is UpdateUserDetailsSuccess &&
                      FirebaseAuth.instance.currentUser!.emailVerified) {
                    context.pushNamedAndRemoveUntil(Routing.home,
                        predicate: (routing) => false);
                  } else if (!FirebaseAuth
                      .instance.currentUser!.emailVerified) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        title: S.of(context).warning,
                        content: S.of(context).PleaseVerifyYourAccount,
                        type: 'f',
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  } else if (state is UpdateUserDetailsFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupWindow(
                        title: S.of(context).warning,
                        content: state.eMessage,
                        type: 'type',
                        ok: () {
                          context.pop();
                        },
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed:
                        UpdateUserDetailsCubit.get(context).updateUserDetails,
                    child: state is UpdateUserDetailsLoading
                        ? const LoadingWidget()
                        : Text(
                            S.of(context).login,
                            style: AppFonts.regular18White,
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
