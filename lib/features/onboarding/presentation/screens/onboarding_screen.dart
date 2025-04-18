import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/config/utils/extensions/layout_extensions.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends HookConsumerWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SharedPrefController.setShowOnce();
    final controller = usePageController();
    final index = useState(0);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: 20.spaceHorizontal,
          children: [
            80.addVerticalSpace,
            SizedBox(
              height: 200.height,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) =>
                    Image.asset(onboardingData[index].imagePath),
                itemCount: 3,
                onPageChanged: (value) => index.value = value,
              ),
            ),
            32.addVerticalSpace,
            Text(
              onboardingData[index.value].title.tr(),
              textAlign: TextAlign.center,
              style: context.titleMedium.copyWith(fontSize: 22),
            ),
            32.addVerticalSpace,
            Text(
              onboardingData[index.value].description.tr(),
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
            32.addVerticalSpace,
            SmoothPageIndicator(
              controller: controller, // PageController
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: ColorManager.primary,
                  dotHeight: 9,
                  dotWidth: 10), // your preferred effect
            ).center(),
            40.addVerticalSpace,
            index.value != 2
                ? CustomButtonWidget(
                    title: LocaleKeys.next.tr(),
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    })
                : Column(
                    children: [
                      CustomButtonWidget(
                          title: LocaleKeys.joinAsUser.tr(),
                          onPressed: () {
                            context.navigateAndReplace(RoutesName.signInScreen);
                          }),
                      16.addVerticalSpace,
                      CustomButtonWidget(
                          title: LocaleKeys.joinAsShowrooms.tr(),
                          onPressed: () {
                            context.setLocale(Locale('en'));
                            //TODO: futuristic
                            print('go to show rooms screen');
                          })
                    ],
                  ),
            TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: Text(LocaleKeys.skip.tr()))
          ],
        ),
      ),
    );
  }
}
