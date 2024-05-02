import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  bool? getData({required String key}) {
    return sharedPreferences.getBool(key);
  }

  Future<void> setCurrentLanguageCode({required String languageCode}) async {
    sharedPreferences.setString(CacheKeys.currentLanguageCode, languageCode);
  }

  Future<void> setCurrentLanguage({required String language}) async {
    sharedPreferences.setString(CacheKeys.currentLanguage, language);
  }

  String? getCurrentLanguageCode() {
    return sharedPreferences.getString(CacheKeys.currentLanguageCode);
  }

  String? getCurrentLanguage() {
    return sharedPreferences.getString(CacheKeys.currentLanguage);
  }
}

abstract class CacheKeys {
  static const String isFirstTime = 'isFirstTime';
  static const String currentLanguageCode = 'currentLanguageCode';
  static const String currentLanguage = 'currentLanguage';
}
