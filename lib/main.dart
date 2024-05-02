import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_cubit.dart';
import 'package:testfirebase/core/helpers/bloc_observer.dart';
import 'package:testfirebase/core/routes/app_routers.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/todo_app.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  bool? isFirstTime = getIt<CacheHelper>().getData(key: CacheKeys.isFirstTime);
  if (isFirstTime == null) {
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.isFirstTime, value: true);
  }

  runApp(
    DevicePreview(
      builder: (context) => BlocProvider(
        create: (context) => ChangeLanguageCubit(),
        child: TodoApp(
          appRouter: AppRouter(),
          isFirstTime: isFirstTime == null,
        ),
      ),
    ),
  );
}
