part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String sMessage;

  ResetPasswordSuccess({required this.sMessage});
}

final class ResetPasswordFailure extends ResetPasswordState {
  final String eMessage;

  ResetPasswordFailure({required this.eMessage});
}
