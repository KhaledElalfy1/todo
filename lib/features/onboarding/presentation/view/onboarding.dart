import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/database/cache/shared_preferences.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:testfirebase/features/onboarding/presentation/view/widgets/indicator.dart';
import 'package:testfirebase/features/onboarding/presentation/view/widgets/onboarding_widget.dart';
import 'package:testfirebase/generated/l10n.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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
                  getIt<CacheHelper>()
                      .saveData(key: CacheKeys.isFirstTime, value: false);
                },
                child: Text(
                  S.of(context).skip,
                  style: AppFonts.regular20White,
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
                      itemCount: OnboardingCubit.get(context).onboarding.length,
                      itemBuilder: (context, index) => OnboardingWidget(
                        onboarding: OnboardingCubit.get(context).onboarding,
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
                    onPressed: () =>
                        OnboardingCubit.get(context).getBack(context),
                    child: Text(
                      S.of(context).back,
                      style: AppFonts.regular20White,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        OnboardingCubit.get(context).getNext(context),
                    child: BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Text(
                          OnboardingCubit.get(context).text,
                          style: AppFonts.regular20White,
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
