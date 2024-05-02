import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  String currentLanCode = 'en';
  String currentLan = 'English';
  Map<String, String> languages = {
    "English": "en",
    "Arabic": "ar",
  };

  void changeLanguageFromMenu(String lang) {
    currentLan = lang;
    currentLanCode = languages[lang]!;
    emit(ChangeLanguageDone());
  }
}
