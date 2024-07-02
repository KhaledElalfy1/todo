import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:testfirebase/core/utils/app_images.dart';
import 'package:testfirebase/core/widgets/shimmer_custom_loading.dart';

class CachedProfilePhoto extends StatelessWidget {
  const CachedProfilePhoto({super.key, required this.radius, required this.hight, required this.width});
  final double radius;
  final double hight;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height:hight ,
        width: width,
        imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
        placeholder: (context, url) => ShimmerCustomLoading(radius: radius),
        errorWidget: (context, url, error) =>
            Image.asset(AppImages.defaultProfilePicture),
      ),
    );
  }
}
