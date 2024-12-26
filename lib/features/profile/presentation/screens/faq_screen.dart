import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/expanionTile_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'FAQ’S'),
      body: ListView(
        padding:  const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.paddingHorizontal,
          vertical: AppPadding.paddingVertical,
        ),
        children: [
          Text('Have Questions? We Have Answers!',style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
          ),),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.whatIsThePurpose.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.howCanIDownload.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.isTheGymMobile.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.canIBookFitnessClasses.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.doesTheGymMobile.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
          const ExpansionTileWidget(
            title: 'string.canITrackMyFitness.tr()',
            text: 'string.theGymMobile.tr()',
          ),
          8.addVerticalSpace,
        ],
      ),
    );
  }
}
