import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/commonWidgets/popup_widget.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_facebook_provider.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_google_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialMediaWidget extends ConsumerWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInWithGoogleProvider, (p, n) {
      n.when(
          data: (data) {
            context.navigateAndRemoveUntil(
                RoutesName.mainAppScreen, (_) => false);
            navigatorKey.currentContext!.showSnackBar(
                message: 'Login Success', backgroundColor: Colors.green);
          },
          error: (error, stack) {
            context.showSnackBar(
                message: error.toString(), backgroundColor: Colors.red);
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    });
    ref.listen(signInWithFacebookProvider, (p, n) {
      n.when(
          data: (data) {
            context.navigateAndRemoveUntil(
                RoutesName.mainAppScreen, (_) => false);
            navigatorKey.currentContext!.showSnackBar(
                message: 'Login Success', backgroundColor: Colors.green);
          },
          error: (error, stack) {
            context.showSnackBar(
                message: error.toString(), backgroundColor: Colors.red);
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    });
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
                ref.read(signInWithGoogleProvider.notifier).signInWithGoogle();
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
                ref
                    .read(signInWithFacebookProvider.notifier)
                    .signInWithFacebook();
                // context.setLocale(Locale('en'));
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
                context.setLocale(const Locale('ar'));
              },
              child: MainCard(
                  horizontal: 13,
                  vertical: 13,
                  border: 25,
                  child: CustomSvgAssets(
                    path: ImagePath.apple,
                    color: context.isDark
                        ? ColorManager.primary10
                        : ColorManager.primary,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
