import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/sign_in/data/repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isVisable = true;
  Icon visibility = const Icon(Icons.visibility_off);

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void changeVisibility() {
    isVisable = !isVisable;
    visibility = isVisable == true
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(SignInChangeIcon());
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Email';
    }
    if (!value.contains('@gmail.com')) {
      return 'Enter should contain @gmail.com format';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.length < 8) {
      return 'password can\'t be less than 8 character';
    }
    return null;
  }

  void signIn() async {
    emit(SignInLoading());
    final result = await getIt<SignInRepo>()
        .signIn(email: emailController.text, password: passwordController.text);

    result.fold(
      (eMessage) => emit(
        SignInFailure(eMessage: eMessage),
      ),
      (sMessage) => emit(
        SignInSuccess(sMessage: sMessage),
      ),
    );
  }
}
