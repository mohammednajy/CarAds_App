import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final List<String> policy = [
    '1. Information Collection and Use:\nWe may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.',
    '2. Data Security:\nThe security of your data is our top priority. We employ industry-standard measures to protect your information from unauthorized access, disclosure, or alteration.',
    '3. Third-Party Services:\nWe may use third-party services to enhance our app\'s functionality and analytics. Please review the respective privacy policies of these services to understand their data practices.',
    '4. Cookies and Tracking:\nWe may use cookies and similar tracking technologies to improve user experience and analyze app usage. By using [Your App Name], you consent to the use of cookies as outlined in this policy.',
    '5. User Content:\nAny content you voluntarily share on CarADS App, such as advertisements, messages, or reviews, may be visible to other users. Please exercise caution while sharing personal information.',
  ];

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
          ...policy.map(
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
