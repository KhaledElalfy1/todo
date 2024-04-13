
import 'package:flutter/material.dart';
import 'package:testfirebase/core/helpers/extentions.dart';

import 'app_bar_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarIcon(
          onTap: () {
            context.pop();
          },
          icon: Icons.close,
        ),
        AppBarIcon(
          onTap: () {},
          icon: Icons.repeat,
        ),
      ],
    );
  }
}
