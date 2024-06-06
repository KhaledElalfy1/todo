part of 'counter_cubit.dart';


sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class CounterTicTak extends CounterState {}
final class CounterStop extends CounterState {}
final class CounterSetTime extends CounterState {}
