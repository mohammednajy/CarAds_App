import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/features/profile/data/models/data_model.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Terms & Conditions',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.paddingHorizontal,
        ),
        children: [
          Text(
            'Welcome to CarADS! These Terms and Conditions  govern your use of the CarADS mobile application and its associated services. By using our Services, you agree to these Terms. Please read them carefully.',
            style: context.titleMedium.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          16.addVerticalSpace,
          ...terms.map(
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
