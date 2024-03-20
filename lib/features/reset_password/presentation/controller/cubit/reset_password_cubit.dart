import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/reset_password/data/repo/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (!value.contains('@gmail.com')) {
      return 'Invalid Email formate';
    }
    return null;
  }

  void resetPassword() async {
    emit(ResetPasswordLoading());
    final result = await getIt<ResetPasswordRepo>()
        .resetPassword(email: emailController.text);
    result.fold(
      (eMessage) => emit(
        ResetPasswordFailure(eMessage: eMessage),
      ),
      (sMessage) => emit(
        ResetPasswordSuccess(sMessage: sMessage),
      ),
    );
  }
}
