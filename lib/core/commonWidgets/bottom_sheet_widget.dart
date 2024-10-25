import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/utils/extensions/sized_box.dart';
import 'package:car_ads_app/core/utils/extensions/text_extension.dart';
import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String address;
  final String bodyText;
  final String buttonText;
  final String secondButtonText;
  final void Function() onPressedButton;
  final void Function() onPressedTextButton;

  const BottomSheetWidget({
    super.key,
    required this.address,
    required this.bodyText,
    required this.buttonText,
    required this.secondButtonText,
    required this.onPressedButton,
    required this.onPressedTextButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPadding.paddingHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          8.addVerticalSpace,
          Container(
            width: 49,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.dragHandColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address,
                style: context.titleMedium,
              ),
              IconButton(
                onPressed: () {
                  context.canGoBack();
                },
                icon: const Icon(
                  Icons.close,
                  color: ColorManager.black,
                ),
              )
            ],
          ),
          24.addVerticalSpace,
          Text(
            bodyText,
            style: context.bodyMedium,
          ),
          // Spacer(),
          32.addVerticalSpace,
          CustomButtonWidget(
            title: buttonText,
            onPressed: onPressedButton,
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor:
                      const WidgetStatePropertyAll(ColorManager.warningColor),
                ),
          ),
          16.addVerticalSpace,
          TextButton(
            onPressed: onPressedTextButton,
            child: Text(secondButtonText),
          ),
          16.addVerticalSpace,
        ],
      ),
    );
  }
}
