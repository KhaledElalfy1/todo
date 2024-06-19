import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_cubit.dart';
import 'package:testfirebase/core/global_controller/change_language_cubit/change_language_state.dart';
import 'package:testfirebase/core/routes/app_routers.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/generated/l10n.dart';

class TodoApp extends StatelessWidget {
  const TodoApp(
      {super.key, required this.appRouter, });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(getIt<CacheHelper>().getCurrentLanguageCode()??'en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: getInitRoute(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            theme: appTheme(),
          );
        },
      ),
    );
  }

  String getInitRoute() {
    if (getIt<CacheHelper>().getData(key: CacheKeys.isFirstTime)) {
      return Routing.init;
    }
    return (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? Routing.home
        : Routing.welcomeScreen;
  }
}
