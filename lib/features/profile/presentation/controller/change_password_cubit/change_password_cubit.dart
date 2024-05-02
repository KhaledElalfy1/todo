import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_password_cubit/change_password_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    return super.close();
  }

  String? validateTextFiled(String? value) {
    if (value!.isEmpty) {
      return S.current.filedRequired;
    }
    if (value.length < 8) {
      return S.current.passwordShort;
    }
    if (oldPasswordController.text == newPasswordController.text) {
      return S.current.passwordSame;
    }

    return null;
  }

  void reauthenticateAndChangePassword() {
    final user = FirebaseAuth.instance.currentUser!;
    final cred = EmailAuthProvider.credential(
        email: user.email!, password: oldPasswordController.text);
    user
        .reauthenticateWithCredential(cred)
        .then((value) => _changePassword())
        .catchError(
      (e) {
        emit(ChangePasswordFailure(eMessage:S.current.wrongPassword ));
        debugPrint(e.toString());
      },
    );
  }

  void _changePassword() async {
    emit(ChangePasswordLoading());

    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(newPasswordController.text);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(eMessage: S.current.unexpectedError));
      debugPrint(e.toString());
    }
  }
}
