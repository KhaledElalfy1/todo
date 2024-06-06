import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/foucs/presentation/view/counter_cubit/counter_cubit.dart';
import 'package:testfirebase/features/foucs/presentation/view/widgets/custom_timer_button.dart';
import 'package:testfirebase/features/foucs/presentation/view/widgets/custom_timer_dialog.dart';
import 'package:testfirebase/features/foucs/presentation/view/widgets/percentage_indicator.dart';
import 'package:testfirebase/generated/l10n.dart';

class FocusRoute extends StatelessWidget {
  const FocusRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(S.of(context).focusTimer),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomTimeDialog(),
                      ).then(
                        (value) => CounterCubit.get(context)
                            .handleTimerDialogResult(value),
                      );
                    },
                    child: Text(
                      S.of(context).setTimer,
                      style: AppFonts.medium20White,
                    ),
                  ),
                  Gap(20.h),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return CustomPercentageIndicator(
                        finalValue: CounterCubit.get(context).maxSeconds,
                        counter: CounterCubit.get(context).seconds,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Gap(30.h),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              bool isActive =
                  CounterCubit.get(context).timer?.isActive ?? false;
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTimerButton(
                        onPressed: isActive
                            ? CounterCubit.get(context).stopTimer
                            : CounterCubit.get(context).startTimer,
                        label: isActive ? S.of(context).pause : S.of(context).start,
                        icon: isActive ? Icons.pause : Icons.play_arrow,
                      ),
                      Gap(30.w),
                      if (CounterCubit.get(context).seconds == 0)
                        CustomTimerButton(
                          onPressed: CounterCubit.get(context).resetTimer,
                          label: S.of(context).reset,
                          icon: Icons.restart_alt,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
