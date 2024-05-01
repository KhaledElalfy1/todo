
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordFailure extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {}
