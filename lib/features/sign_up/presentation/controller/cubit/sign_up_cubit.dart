import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/sign_in/data/repo/sign_in_repo.dart';
import 'package:testfirebase/features/sign_up/data/repo/sign_up_repo.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  Icon passwordVisibility = const Icon(Icons.visibility_off);
  Icon confirmPasswordVisibility = const Icon(Icons.visibility_off);
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordVisibility = isPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    emit(SignUpChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    confirmPasswordVisibility = isConfirmPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    emit(SignUpChangeConfirmPasswordVisibility());
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Enter Your Email';
    }
    if (!value.contains('@gmail.com')) {
      return 'Email should have @gmail.com format';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.length < 8) {
      return 'password is less than 8 character';
    }

    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      return 'two password don\'t match';
    }

    return null;
  }

  Future<void> signUp() async {
    emit(SignUpLoading());
    final result = await getIt<SignUpRepo>()
        .signIn(email: emailController.text, password: passwordController.text);

    result.fold(
      (eMessage) => emit(
        SignUpFailure(eMessage: eMessage),
      ),
      (sMessage) => emit(
        SignUpSuccess(sMessage: sMessage),
      ),
    );
  }

  void googleSignUp() async {
    emit(GoogleSignUpLoading());
    final result = await getIt<SignInRepo>().signInWithGoogle();

    result.fold(
      (eMessage) => emit(
        GoogleSignUpFailure(eMessage: eMessage),
      ),
      (r) => emit(
        GoogleSignUpSuccess(),
      ),
    );
  }
}
