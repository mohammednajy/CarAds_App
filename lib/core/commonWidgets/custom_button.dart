import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.title,
    required this.onPressed,
    super.key,
    this.textColor,
    this.isLoading = false,
    this.showIcon = false,
    this.fontSize,
    this.fontWeight,
    this.style,
    this.icon,
    this.loadingColor = Colors.white,
  });

  final void Function() onPressed;
  final String title;
  final Color? textColor;
  final Color loadingColor;
  final bool isLoading;
  final bool showIcon;
  final double? fontSize;
  final FontWeight? fontWeight;

  final ButtonStyle? style;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading == true
          ? Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: loadingColor),
              ),
            )
          : showIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.paddingHorizontal),
                  child: Row(
                    children: [
                      CustomSvgAssets(
                        path: icon,
                      ),
                      const Spacer(),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: fontSize,
                            color: textColor,
                            fontWeight: fontWeight),
                      ),
                      const Spacer()
                    ],
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                ),
    );
  }
}
