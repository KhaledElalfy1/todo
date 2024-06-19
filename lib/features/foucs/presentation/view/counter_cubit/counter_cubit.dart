import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(context) => BlocProvider.of(context);
  TextEditingController minutesController = TextEditingController(text: '0');
  TextEditingController secondsController = TextEditingController(text: '0');
  static const int _defaultMaxMinutes = 1;
  static const int _defaultMaxSeconds = _defaultMaxMinutes * 60;
  int maxSeconds = _defaultMaxSeconds;
  int seconds = _defaultMaxSeconds;
  Timer? timer;
  @override
  Future<void> close() {
    minutesController.dispose();
    secondsController.dispose();
    timer?.cancel();
    return super.close();
  }

  int parseInput(String input, int defaultValue) {
    return int.tryParse(input) ?? defaultValue;
  }

  void updateTimerSetting() {
    int minutes = parseInput(minutesController.text, 0);
    int inputSeconds = parseInput(secondsController.text, 0);
    maxSeconds = minutes * 60 + inputSeconds;
    seconds = maxSeconds;
    emit(CounterSetTime());
  }
    void handleTimerDialogResult(Set<TextEditingController>? value) {
    if (value != null && value.length == 2) {
      minutesController = value.elementAt(0);
      secondsController = value.elementAt(1);
      updateTimerSetting();
    }
  }
  void startTimer() {
    // updateTimerSetting();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          seconds--;
          emit(CounterTicTak());
        } else {
          stopTimer();
        }
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
    emit(CounterStop());
  }

  void resetTimer() {
    updateTimerSetting();
  }

  String formatTime() {
    int minute = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minute.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
