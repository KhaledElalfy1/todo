import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());
  static CalenderCubit get(context) => BlocProvider.of(context);
  DateTime selectedDate = DateTime.now();
  void changeSelectedDay(DateTime date) {
    selectedDate = date;
    emit(ChangeDateSuccess());
  }
}
