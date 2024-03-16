part of 'sign_up_cubit.dart';


sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpChangePasswordVisibility extends SignUpState {}
final class SignUpChangeConfirmPasswordVisibility extends SignUpState {}
