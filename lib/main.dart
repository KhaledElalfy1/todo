import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/helpers/bloc_observer.dart';
import 'package:testfirebase/core/routes/app_routers.dart';
import 'package:testfirebase/todo_app.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      builder: (context) => TodoApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
