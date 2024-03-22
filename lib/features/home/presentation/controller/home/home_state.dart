part of 'home_cubit.dart';


sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class AddItemLoading extends HomeState {}

final class AddItemSuccess extends HomeState {}

final class AddItemFailure extends HomeState {}
