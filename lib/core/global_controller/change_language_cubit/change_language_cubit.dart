import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_state.dart';
import 'package:testfirebase/core/service/service_locator.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  Map<String, String> languages = {
    "English": "en",
    "Arabic": "ar",
  };

  void changeLanguageFromMenu(String lang) async {
    await getIt<CacheHelper>().setCurrentLanguage(language: lang);
    await getIt<CacheHelper>()
        .setCurrentLanguageCode(languageCode: languages[lang]!);
    emit(ChangeLanguageDone());
  }
}
