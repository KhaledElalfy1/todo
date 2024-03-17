part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpChangePasswordVisibility extends SignUpState {}

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
