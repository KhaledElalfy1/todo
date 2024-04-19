import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_state.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar.dart';

import '../controller/change_route_cubit/change_route_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: BlocBuilder<ChangeRouteCubit, ChangeRouteState>(
          builder: (context, state) => ChangeRouteCubit.get(context)
              .routes[ChangeRouteCubit.get(context).currentRoute],
        ),
      ),
      bottomNavigationBar: const CustomButtonNavBar(),
    );
  }
}
