import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.paddingHorizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              'Well Done',
              style: context.titleMedium.copyWith(
                fontSize: 22,
              ),
            ),
            const CustomSvgAssets(path: ImagePath.doneFrame),
            Text(
                'Congratulations! Your password  has been changed successfully!',
                textAlign: TextAlign.center,
                style: context.bodyMedium),
            24.addVerticalSpace,
            CustomButtonWidget(
              title: 'Back To Profile',
              onPressed: () {
                context.navigateAndRemoveUntil(
                    RoutesName.mainAppScreen, (_) => false,
                    arguments: 4);
              },
            )
          ],
        ),
      ),
    );
  }
}
