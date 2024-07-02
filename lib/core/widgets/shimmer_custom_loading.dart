import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_color.dart';

class ShimmerCustomLoading extends StatelessWidget {
  const ShimmerCustomLoading({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.lightGrey,
      highlightColor: AppColor.white,
      child: CircleAvatar(
        radius: radius,
      ),
    );
  }
}
