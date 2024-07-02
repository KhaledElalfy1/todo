sealed class UpdateUserDetailsState {}

final class UpdateUserDetailsInitial extends UpdateUserDetailsState {}

final class UpdateUserDetailsSuccess extends UpdateUserDetailsState {}

final class UpdateUserDetailsFailure extends UpdateUserDetailsState {
  final String eMessage;

  UpdateUserDetailsFailure({required this.eMessage});
}
