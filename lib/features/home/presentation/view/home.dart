import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/no_data_section.dart';
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
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) => state is GetTaskLoading
                  ? const LinearProgressIndicator()
                  : const SizedBox(),
            ),
            Gap(20.h),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetTaskSuccess) {
                    if (state.tasks.isEmpty) {
                      return const NoDataBody();
                    }
                    return SuccessBody(
                      tasks: HomeCubit.get(context).userTasks,
                    );
                  } else if (state is GetTaskFailure) {
                    return Center(
                      child: Text(state.eMessage),
                    );
                  } else {
                    return SuccessBody(
                      tasks: HomeCubit.get(context).userTasks,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtonNavBar(),
    );
  }
}
