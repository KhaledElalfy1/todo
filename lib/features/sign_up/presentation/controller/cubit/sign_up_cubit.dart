import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
}
