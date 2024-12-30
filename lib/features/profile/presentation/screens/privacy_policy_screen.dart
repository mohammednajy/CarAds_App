import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/features/profile/data/models/data_model.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Privacy Policy',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.paddingHorizontal,
        ),
        children: [
          Text(
            'At CarADS APP, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.',
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w400),
          ),
          16.addVerticalSpace,
          ...policyData.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                e,
                style: context.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
