import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyHomeCard extends HookConsumerWidget {
  const BodyHomeCard({super.key});
  static const images = [
    ImagePath.car1,
    ImagePath.car2,
    ImagePath.car3,
    ImagePath.car4,
    ImagePath.car5,
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return MainCard(
      vertical: 20.height,
      horizontal: 20.height,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.navigateTo(RoutesName.allCarsScreen);
            },
            child: SizedBox(
              height: 200.height,
              child: PageView(
                  controller: controller,
                  children: List.generate(
                    5,
                    (value) => Image.asset(images[value]),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Toyota',
                style: context.titleMedium,
              ),
              Text(
                '16000/AED',
                style: context.bodyMedium,
              ),
            ],
          ),
          9.addVerticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(IconsPath.automaticIcon),
              Text(
                'Automatic',
                style: context.labelSmall,
              ),
              Text(
                '|',
                style: context.labelSmall,
              ),
              SvgPicture.asset(IconsPath.seatIcon),
              Text('Seats', style: context.labelSmall),
              Text('|', style: context.labelSmall),
              SvgPicture.asset(IconsPath.diselIcon),
              Text('Disel', style: context.labelSmall),
            ],
          ),
          24.addVerticalSpace,
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const ExpandingDotsEffect(
                activeDotColor: ColorManager.primaryTextColor,
                spacing: 3,
                dotHeight: 9,
                dotWidth: 10), // your preferred effect
          )
        ],
      ),
    );
  }
}
