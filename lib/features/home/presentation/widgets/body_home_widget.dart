import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/commonWidgets/netowrk_image_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/home/domain/providers/banners_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyHomeCard extends HookConsumerWidget {
  const BodyHomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    final banners = ref.watch(bannersProvider);
    final bannerIndex = useState<int>(0);
    return banners.when(
      data: (data) => MainCard(
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
                    onPageChanged: (value) => bannerIndex.value = value,
                    children: List.generate(
                      data.length,
                      (value) => NetworkImageWidget(
                        image: data[value].photos.first,
                        height: 200.height,
                      ),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data[bannerIndex.value].carBrand,
                  style: context.titleMedium,
                ),
                Text(
                  '${data[bannerIndex.value].price}/AED',
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
                  data[bannerIndex.value].gearBox,
                  style: context.labelSmall,
                ),
                Text(
                  '|',
                  style: context.labelSmall,
                ),
                SvgPicture.asset(IconsPath.seatIcon),
                Text('${data[bannerIndex.value].seatNumber} seats',
                    style: context.labelSmall),
                Text('|', style: context.labelSmall),
                SvgPicture.asset(IconsPath.diselIcon),
                Text(data[0].petrolKind, style: context.labelSmall),
              ],
            ),
            24.addVerticalSpace,
            SmoothPageIndicator(
              controller: controller,
              count: data.length,
              effect: const ExpandingDotsEffect(
                  activeDotColor: ColorManager.primaryTextColor,
                  spacing: 3,
                  dotHeight: 9,
                  dotWidth: 10), // your preferred effect
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => Skeletonizer(
          enabled: true,
          child: Container(
            color: Colors.white,
            height: 300.height,
            width: double.infinity,
          )),
    );
  }
}
