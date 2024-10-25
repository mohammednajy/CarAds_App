import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/skeletonWidget/baseShimmerWidget.dart';
import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:flutter/material.dart';

class ProfileCardSkeleton extends StatelessWidget {
  const ProfileCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListTile(
      tileColor: ColorManager.primary,
      contentPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: SizedBox(
          height: 59,
          width: 59,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Skeleton(),
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            width: size.width * 0.3,
          ),
          // 8.addVerticalSpace,
          Skeleton(
            width: size.width * 0.5,
          ),
        ],
      ),
      trailing: const MainContainer(
          height: 30,
          width: 30,
          color: ColorManager.backGroundColor,
          child: Skeleton()),
    );
  }
}
