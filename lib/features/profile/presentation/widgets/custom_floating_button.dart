import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorManager.backGroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -1),
                color: ColorManager.primary10,
                blurRadius: 9)
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.paddingHorizontal,
          vertical: 17,
        ),
        child: CustomButtonWidget(title: buttonText, onPressed: onPressed),
      ),
    );
  }
}
