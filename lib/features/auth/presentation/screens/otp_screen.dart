import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
              'Verify Your Phone Number',
              style: context.titleMedium,
            ),
            4.addVerticalSpace,
            Text(
              'Please Enter The Otp Code Sent To  +972 59****208',
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
            32.addVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(height: 48,width: 78,color: Colors.black,),
              Container(height: 48,width: 78,color: Colors.black,),
              Container(height: 48,width: 78,color: Colors.black,),
              Container(height: 48,width: 78,color: Colors.black,),
            ],),
            16.addVerticalSpace,
            CustomButtonWidget(
              title: 'Verify',
              onPressed: () async {},
            ),
            32.addVerticalSpace,
            Text(
              'Resend code in 56 s',
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
