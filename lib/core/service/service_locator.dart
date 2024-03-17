import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:testfirebase/features/sign_up/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => SignUpRepo());
  getIt.registerLazySingleton(() => Logger());
}
