import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_images.dart';
import 'package:testfirebase/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:testfirebase/features/onboarding/presentation/view/widgets/indicator.dart';
import 'package:testfirebase/features/onboarding/presentation/view/widgets/onboarding_widget.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  final List<Map<String, String>> onboarding = const [
    {
      'imagePath': AppImages.imagesOnbodrding1,
      'title': 'Manage your tasks',
      'subtitle':
          'You can easily manage all of your daily tasks in DoMe for free',
    },
    {
      'imagePath': AppImages.imagesOnbodrding2,
      'title': 'Create daily routine',
      'subtitle':
          'In Uptodo  you can create your personalized routine to stay productive',
    },
    {
      'imagePath': AppImages.imagesOnbodrding3,
      'title': 'Orgonaize your tasks',
      'subtitle':
          'You can organize your daily tasks by adding your tasks into separate categories',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routing.welcomeScreen);
                },
                child: Text(
                  'SKIP',
                  style: AppFonts.regular16White,
                ),
              ),
              Gap(10.h),
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: OnboardingCubit.get(context).controller,
                      onPageChanged: (value) {
                        OnboardingCubit.get(context).updateIndicator(value);
                      },
                      itemCount: onboarding.length,
                      itemBuilder: (context, index) => OnboardingWidget(
                        onboarding: onboarding,
                        index: index,
                      ),
                    ),
                    BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Align(
                          alignment: const Alignment(0, 0.1),
                          child: IndicatorWidget(
                            position: OnboardingCubit.get(context).indicator,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => OnboardingCubit.get(context).getBack(),
                    child: Text(
                      'BACK',
                      style: AppFonts.regular16White,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        OnboardingCubit.get(context).getNext(context),
                    child: BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Text(
                          OnboardingCubit.get(context).text,
                          style: AppFonts.regular16White,
                        );
                      },
                    ),
                  )
                ],
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
