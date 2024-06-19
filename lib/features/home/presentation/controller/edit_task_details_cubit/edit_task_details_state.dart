sealed class EditTaskDetailsState {}

final class EditTaskDetailsInitial extends EditTaskDetailsState {}

final class EditTaskDetailsLoading extends EditTaskDetailsState {}

final class EditTaskDetailsSuccess extends EditTaskDetailsState {}

final class EditTaskDetailsFailure extends EditTaskDetailsState {
  final String eMessage;

  EditTaskDetailsFailure({required this.eMessage});
}
