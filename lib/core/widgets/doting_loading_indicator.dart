import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:testfirebase/core/utils/app_color.dart';

class DotingLoadingIndicator extends StatelessWidget {
  const DotingLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      color: AppColor.primaryColor,
      size: 25,
    );
  }
}
