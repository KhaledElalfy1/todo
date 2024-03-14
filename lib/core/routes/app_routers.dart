import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/features/home/presentation/view/home.dart';
import 'package:testfirebase/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:testfirebase/features/onboarding/presentation/view/onboarding.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child:const Onboarding(),
          ),
        );
      case Routing.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Route'),
            ),
          ),
        );
    }
  }
}
