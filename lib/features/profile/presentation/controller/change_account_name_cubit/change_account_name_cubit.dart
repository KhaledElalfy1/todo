import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/profile/presentation/controller/change_account_name_cubit/change_account_name_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class ChangeAccountNameCubit extends Cubit<ChangeAccountNameState> {
  ChangeAccountNameCubit() : super(ChangeAccountNameInitial());
  static ChangeAccountNameCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController(text: FirebaseAuth.instance.currentUser!.displayName);
  final GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }

  Future<void> changeAccountName() async {
    emit(ChangeAccountNameLoading());
    try {
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(nameController.text);
      emit(ChangeAccountNameSuccess());
    } on Exception catch (e) {
      emit(
        ChangeAccountNameFailure(
          eMessage: e.toString(),
        ),
      );
    }
  }

  String? validator(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).filedRequired;
    }
    if (value.length > 2) {
      return S.of(context).nameIsLessThanTwo;
    }
    return null;
  }
}
