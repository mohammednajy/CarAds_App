import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:flutter/material.dart';

class CarLabelWidget extends StatelessWidget {
  const CarLabelWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          color: ColorManager.purpleSecondary,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: context.labelSmall.copyWith(
          fontSize: 12,
          color: ColorManager.purplePrimary,
        ),
      ),
    );
  }
}
