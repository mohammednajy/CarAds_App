import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({super.key});

  final List<String> terms = [
    '1. Acceptance of Terms:\nBy downloading, installing, or using the App, you agree to be bound by these Terms and our Privacy Policy. If you do not agree, you must not use the App.',
    '2. Eligibility\nTo use the App, you must:/n* Be at least 18 years old.\n* Comply with all applicable laws and regulations.\n* Provide accurate and truthful information when creating an account.',
    '3. Account Registration\n* You are responsible for maintaining the confidentiality of your login credentials.\n* You must notify us immediately of any unauthorized access to your account.\n* CarADS reserves the right to suspend or terminate accounts at its discretion for any violation of these Terms.',
    '4. Use of the App\nYou agree to:\n* Use the App solely for its intended purpose of advertising or browsing vehicle-related listings.\n* Not use the App for illegal activities, fraud, or harassment.\n* Not upload content that is misleading, defamatory, obscene, or infringes on the intellectual property rights of others.',
    '5. Listings and Advertisements\n* Users are responsible for the accuracy of all content posted in their advertisements.\n* CarADS does not guarantee the quality, safety, or legality of vehicles listed on the App.\n* CarADS reserves the right to remove any listings or advertisements that violate these Terms.',
    '15. Contact Information\nIf you have questions about these Terms, please contact us at:\n Email: ahedeid2000@gmail.com\n Phone: 00972566565365\n Address: Palestine - Gaza .\n Thank you for using CarADS!\n',
  ];

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
