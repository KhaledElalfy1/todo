part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}


final class SignUpChangeConfirmPasswordVisibility extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String sMessage;

  SignUpSuccess({required this.sMessage});
}

final class SignUpFailure extends SignUpState {
  final String eMessage;

  SignUpFailure({required this.eMessage});
}


final class GoogleSignUpLoading extends SignUpState {}
final class GoogleSignUpSuccess extends SignUpState {}
final class GoogleSignUpFailure extends SignUpState {
    final String eMessage;

  GoogleSignUpFailure({required this.eMessage});
}



final class SignUpChangePasswordVisibility extends SignUpState {}
