import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_cubit.dart';
import 'package:testfirebase/features/foucs/presentation/view/counter_cubit/counter_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/fold_done_list_cubit/fold_done_list_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/home.dart';
import 'package:testfirebase/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:testfirebase/features/onboarding/presentation/view/onboarding.dart';
import 'package:testfirebase/features/reset_password/presentation/controller/cubit/reset_password_cubit.dart';
import 'package:testfirebase/features/reset_password/presentation/view/reset_password.dart';
import 'package:testfirebase/features/sign_in/presentation/controller/cubit/sign_in_cubit.dart';
import 'package:testfirebase/features/sign_in/presentation/view/sign_in.dart';
import 'package:testfirebase/features/sign_up/presentation/controller/cubit/sign_up_cubit.dart';
import 'package:testfirebase/features/sign_up/presentation/view/sign_up.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';
import 'package:testfirebase/features/task_details/presentation/view/task_details.dart';
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeCubit()..getTasks(),
              ),
              BlocProvider(
                create: (context) => ChangeRouteCubit(),
              ),
              BlocProvider(
                create: (context) => FoldDoneListCubit(),
              ),
              BlocProvider(
                create: (context) => CalenderCubit(),
              ),
              BlocProvider(
                create: (context) => CounterCubit(),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case Routing.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routing.taskDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => EditTaskCubit(),
            child: TaskDetails(task: argument as TaskModel),
          ),
        );
      case Routing.resetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(),
            child: const ResetPassword(),
          ),
        );
      case Routing.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUp(),
          ),
        );

      case Routing.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignIn(),
          ),
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
