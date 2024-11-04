import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
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
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.paddingHorizontal),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Container(
              height: 38,
              width: 56,
              decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: BorderRadius.circular(8)),
              child: const CustomSvgAssets(
                path: IconsPath.back,
                width: 46,
                height: 44,
              ),
            ),
            const SizedBox(height: 11),
            const Text(
              'checkYourMail',
              style: TextStyle(
                fontSize: FontSize.s22,
                fontWeight: FontWeight.w700,
                color: ColorManager.primaryTextColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We have sent a password recover instructions to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.s15,
                color: ColorManager.secondTextColor,
              ),
            ),
            const SizedBox(height: 24),
            CustomButtonWidget(
              title: 'openEmail',
              onPressed: () async {
                // OpenMailApp.getMailApps();
                // var result = await OpenMailApp.openMailApp(
                //   nativePickerTitle: 'Select email app to open',
                // );
                // if (!result.didOpen && !result.canOpen) {
                //   showNoMailAppsDialog(context);
                // } else if (!result.didOpen && result.canOpen) {
                //   showDialog(
                //     context: context,
                //     builder: (_) {
                //       return MailAppPickerDialog(
                //         mailApps: result.options,
                //       );
                //     },
                //   );
                // }
                // AppRouter.goTo(screenName: ScreenName.createNewPasswordScreen);
              },
            ),
            const SizedBox(height: 16),
            CustomButtonWidget(
              title: 'iConfirmLatter',
              textColor: ColorManager.secondTextColor,
              fontSize: 14,
              onPressed: () {
                // sl<AppRouter>()
                //     .goToAndRemove(screenName: ScreenName.loginScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
