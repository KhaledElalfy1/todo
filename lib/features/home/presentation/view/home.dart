import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/no_data_section.dart';
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
        child: ListView(
          children: const [
            NoDataBody(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtonNavBar(),
    );
  }
}
