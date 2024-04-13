sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {}

final class EditTaskFailure extends EditTaskState {
  final String eMessage;

  EditTaskFailure({required this.eMessage});
}
final class DeleteTaskLoading extends EditTaskState {}

final class DeleteTaskSuccess extends EditTaskState {}

final class DeleteTaskFailure extends EditTaskState {
  final String eMessage;

  DeleteTaskFailure({required this.eMessage});
}
