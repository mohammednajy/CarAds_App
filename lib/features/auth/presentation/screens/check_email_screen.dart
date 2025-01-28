import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.openMailApp.tr()),
          content: Text(LocaleKeys.noMailAppsInstalled.tr()),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.oK.tr()),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
        visible: true,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.paddingHorizontal),
        child: Column(
          children: [
            const CustomSvgAssets(
              path: ImagePath.otpImage,
            ),
            16.addVerticalSpace,
            Text(
              LocaleKeys.checkYourMail.tr(),
              style: context.titleMedium,
            ),
            4.addVerticalSpace,
            Text(
              LocaleKeys.weHaveSentAPasswordRecover.tr(),
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
            24.addVerticalSpace,
            CustomButtonWidget(
              title: LocaleKeys.openEmail.tr(),
              onPressed: () async {
                OpenMailApp.getMailApps();
                var result = await OpenMailApp.openMailApp(
                  nativePickerTitle: 'Select email app to open',
                );
                if (!result.didOpen && !result.canOpen) {
                  showNoMailAppsDialog(context);
                } else if (!result.didOpen && result.canOpen) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return MailAppPickerDialog(
                        mailApps: result.options,
                      );
                    },
                  );
                }
                context.navigateTo(RoutesName.signInScreen);
              },
            ),
            16.addVerticalSpace,
            CustomButtonWidget(
              title: LocaleKeys.iConfirmLatter.tr(),
              textColor: ColorManager.primaryTextColor,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor:
                        WidgetStateProperty.all(ColorManager.white),
                  ),
              onPressed: () {
                context.navigateAndRemoveUntil(
                    RoutesName.signInScreen, (_) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
