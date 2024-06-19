part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final String sMessage;

  SignInSuccess({required this.sMessage});
}

final class SignInFailure extends SignInState {
  final String eMessage;

  SignInFailure({required this.eMessage});
}

final class GoogleSignInLoading extends SignInState {}

final class GoogleSignInSuccess extends SignInState {}

final class GoogleSignInFailure extends SignInState {
  final String eMessage;

  GoogleSignInFailure({required this.eMessage});
}

final class SignInChangeIcon extends SignInState {}
