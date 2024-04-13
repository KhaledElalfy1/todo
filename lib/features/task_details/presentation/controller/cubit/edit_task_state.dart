sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {}

final class EditTaskFailure extends EditTaskState {
  final String eMessage;

  EditTaskFailure({required this.eMessage});
}
