import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/utils/extensions/layout_extensions.dart';
import 'package:car_ads_app/core/utils/extensions/sized_box.dart';
import 'package:car_ads_app/core/utils/extensions/text_extension.dart';
import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/utils/resources/images_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.navigateAndReplace(RoutesName.onboarding);
    });
    return Scaffold(
      backgroundColor: ColorManager.borderColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(ImagePath.carSplash),
            const Spacer(),
            Text(
              'Welcome to CarAds App',
              style: context.titleMedium
                  .copyWith(fontSize: 22, color: Colors.white),
            ).center(),
            24.addVerticalSpace,
            Text(
              'Your Gateway to Car Showrooms and Rental Offices',
              style: context.bodyMedium.copyWith(
                color: Colors.white,
              ),
            ).center(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
