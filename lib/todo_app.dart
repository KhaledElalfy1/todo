import 'package:flutter/material.dart';
import 'package:testfirebase/core/routes/app_routers.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_theme.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key, required this.appRouter});
final  AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routing.init,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: appTheme(),
    );
  }
}