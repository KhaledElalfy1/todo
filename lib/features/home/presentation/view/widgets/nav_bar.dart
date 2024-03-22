import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/add_item_section.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar_indexs_section.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        IndexSection(),
        Positioned(
          top: -35,
          right: 0,
          left: 0,
          child: AddItemSection(),
        )
      ],
    );
  }
}
