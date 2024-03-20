import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:testfirebase/features/reset_password/data/repo/reset_password_repo.dart';
import 'package:testfirebase/features/sign_in/data/repo/sign_in_repo.dart';
import 'package:testfirebase/features/sign_up/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => SignUpRepo());
  getIt.registerLazySingleton(() => SignInRepo());
  getIt.registerLazySingleton(() => Logger());
  getIt.registerLazySingleton(() => ResetPasswordRepo());
}
