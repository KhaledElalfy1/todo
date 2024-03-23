import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/success_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
        title: Text(
          'Index',
          style: AppFonts.regular20White,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColor.lightGrey,
            ),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetTaskSuccess) {
                return SuccessBody(tasks: state.tasks,);
              } else if (state is GetTaskFailure) {
                return Center(
                  child: Text(state.eMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
      bottomNavigationBar: const CustomButtonNavBar(),
    );
  }
}


