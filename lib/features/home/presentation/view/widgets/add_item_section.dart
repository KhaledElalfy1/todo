import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';

class AddItemSection extends StatelessWidget {
  const AddItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: HomeCubit.get(context).addTask,
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: AppColor.primaryColor,
            child: state is AddItemLoading
                ? const LoadingWidget()
                : const Icon(
                    Icons.add,
                    size: 32,
                  ),
          ),
        );
      },
    );
  }
}
