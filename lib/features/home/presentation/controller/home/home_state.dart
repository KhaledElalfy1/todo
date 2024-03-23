part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class AddTaskLoading extends HomeState {}

final class AddTaskSuccess extends HomeState {}

final class AddTaskFailure extends HomeState {}

final class GetTaskLoading extends HomeState {}

final class GetTaskSuccess extends HomeState {
  final List<TaskModel> tasks;

  GetTaskSuccess({required this.tasks});
}

final class GetTaskFailure extends HomeState {
  final String eMessage;

  GetTaskFailure({required this.eMessage});
}
