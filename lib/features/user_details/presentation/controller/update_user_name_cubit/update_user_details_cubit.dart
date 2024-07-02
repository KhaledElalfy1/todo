import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/user_details/presentation/controller/update_user_name_cubit/update_user_details_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class UpdateUserDetailsCubit extends Cubit<UpdateUserDetailsState> {
  UpdateUserDetailsCubit() : super(UpdateUserDetailsInitial());
  static UpdateUserDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Future<void> close() {
    userNameController.dispose();
    return super.close();
  }

  void updateUserName() {
    try {
      FirebaseAuth.instance.currentUser!
          .updateDisplayName(userNameController.text);
      emit(UpdateUserDetailsSuccess());
    } on Exception catch (e) {
      emit(
        UpdateUserDetailsFailure(
          eMessage: e.toString(),
        ),
      );
    }
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return S.current.filedRequired;
    }
    return null;
  }
}
