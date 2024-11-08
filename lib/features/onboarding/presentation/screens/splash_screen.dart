import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/config/utils/extensions/layout_extensions.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.navigateAndReplace(SharedPrefController.getShowOnce()
          ? SharedPrefController.getLoggedIn()
              ? RoutesName.homeScreenTest
              : RoutesName.signInScreen
          : RoutesName.onboarding);
    });
    return Scaffold(
      backgroundColor: ColorManager.borderColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(ImagePath.carSplash)),
            const Spacer(),
            Text(
              LocaleKeys.onboardingTitle1.tr(),
              style: context.titleMedium
                  .copyWith(fontSize: 22, color: Colors.white),
            ).center(),
            24.addVerticalSpace,
            Text(
              LocaleKeys.splashMessage.tr(),
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
