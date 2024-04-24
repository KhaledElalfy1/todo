
sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}
final class ChangeDateSuccess extends CalenderState {}

final class FilterListLoading extends CalenderState {}
final class FilterListSuccess extends CalenderState {}
final class FilterListFailure extends CalenderState {}
