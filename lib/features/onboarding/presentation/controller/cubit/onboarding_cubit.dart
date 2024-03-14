import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  int indicator = 0;
  String text = 'NEXT';
  PageController controller = PageController();
  void updateIndicator(int index) {
    indicator = index;
    updateText();
    emit(OnboardingUpdateIndicator());
  }

  void updateText() {
    text = indicator == 2 ? 'GET START' : 'NEXT';
  }

  void getNext(BuildContext context) {
    if (indicator == 2) {
      context.pushReplacementNamed(Routing.welcomeScreen);
    } else {
      indicator++;
      controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    updateIndicator(indicator);
  }

  void getBack() {
    if (indicator == 0) {
    } else {
      indicator--;
      controller.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    updateIndicator(indicator);
  }
}
