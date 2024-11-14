import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialMediaWidget extends ConsumerWidget {
  const SocialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.orContinueWith.tr(),
            style: context.bodyMedium,
          ),
        ),
        16.addVerticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(loginProvider.notifier).signInWithGoogle();
              },
              child: const MainCard(
                  horizontal: 13,
                  vertical: 13,
                  border: 25,
                  child: CustomSvgAssets(
                    path: ImagePath.google,
                  )),
            ),
            GestureDetector(
              onTap: () {
                context.setLocale(Locale('en'));
              },
              child: const MainCard(
                  horizontal: 13,
                  vertical: 13,
                  border: 25,
                  child: CustomSvgAssets(
                    path: ImagePath.facebook,
                  )),
            ),
            GestureDetector(
              onTap: () {
                context.setLocale(Locale('ar'));
              },
              child: MainCard(
                  horizontal: 13,
                  vertical: 13,
                  border: 25,
                  child: CustomSvgAssets(
                    path: ImagePath.apple,
                    color: context.isDark ?
                    ColorManager.primary10: ColorManager.primary,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
