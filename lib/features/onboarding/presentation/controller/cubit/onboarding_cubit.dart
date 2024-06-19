import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_images.dart';
import 'package:testfirebase/generated/l10n.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  int indicator = 0;
  String text = S.current.next;
  List<Map<String, String>> onboarding = [
    {
      'imagePath': AppImages.imagesOnbodrding1,
      'title': S.current.title1,
      'subtitle':
          S.current.subtitle1,
    },
    {
      'imagePath': AppImages.imagesOnbodrding2,
      'title': S.current.title2,
      'subtitle':
          S.current.subtitle2,
    },
    {
      'imagePath': AppImages.imagesOnbodrding3,
      'title': S.current.title3,
      'subtitle':
          S.current.subtitle3,
    },
  ];
  PageController controller = PageController();
  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  void updateIndicator(int index) {
    indicator = index;
    updateText();
    emit(OnboardingUpdateIndicator());
  }

  void updateText() {
    final newText = indicator == 2 ? S.current.getStart : S.current.next;
    if (newText != text) {
      text = newText;
      emit(OnboardingUpdateText());
      getIt<CacheHelper>()
                      .saveData(key: CacheKeys.isFirstTime, value: false);
    }
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

  void getBack(BuildContext context) {
    if (indicator == 0) {
    } else {
      indicator--;
      controller.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    updateIndicator(indicator);
  }
}
