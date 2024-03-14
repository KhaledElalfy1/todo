import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/features/home/presentation/view/home.dart';
import 'package:testfirebase/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:testfirebase/features/onboarding/presentation/view/onboarding.dart';
import 'package:testfirebase/features/sign_in/presentation/view/sign_in.dart';
import 'package:testfirebase/features/sign_up/presentation/view/sign_up.dart';
import 'package:testfirebase/features/welcome/presentation/view/welcome.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const Onboarding(),
          ),
        );
      case Routing.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case Routing.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routing.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );

      case Routing.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
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
