import 'package:car_ads_app/core/commonWidgets/bottom_sheet_widget.dart';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/utils/extensions/layout_extensions.dart';
import 'package:car_ads_app/core/utils/extensions/sized_box.dart';
import 'package:car_ads_app/core/utils/extensions/string_extension.dart';
import 'package:car_ads_app/core/utils/extensions/text_extension.dart';
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
                    dotHeight: 9, dotWidth: 10), // your preferred effect
                onDotClicked: (index) {
                  context.setLocale(Locale('ar'));
                }).center(),
            40.addVerticalSpace,
            index.value != 2
                ? CustomButtonWidget(
                    title: LocaleKeys.next.tr(),
                    onPressed: () {
                      print(controller.page);
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    })
                : Column(
                    children: [
                      CustomButtonWidget(
                          title: LocaleKeys.joinAsUser.tr(),
                          onPressed: () {
                            context.navigateAndReplace(RoutesName.login);
                          }),
                      16.addVerticalSpace,
                      CustomButtonWidget(
                          title: LocaleKeys.joinAsShowrooms.tr(),
                          onPressed: () {
                            //TODO: futuristic
                            print('go to show rooms screen');
                          })
                    ],
                  ),
            TextButton(
                onPressed: () {
                  context.navigateAndReplace(RoutesName.login);
                },
                child: Text(LocaleKeys.skip.tr()))
          ],
        ),
      ),
    );
  }
}
