// Try Card

import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    this.height,
    this.color = ColorManager.primary,
    required this.child,
    this.horizontal = 0,
    this.vertical = 0,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.width,
    this.alignment,
  });

  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final Color color;
  final Widget child;
  final double vertical;
  final double horizontal;
  final double top;
  final double bottom;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: bottom, left: left, right: right, top: top),
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 1)),
        ],
      ),
      child: child,
    );
  }
}

class MainCard extends StatelessWidget {
  final String? subtitle;
  final Color backgroundColor;

  final Color? shadowColor;
  final VoidCallback? onTap;
  final Widget child;
  final double top;
  final double bottom;
  final double left;
  final double right;

  const MainCard({
    super.key,
    this.subtitle,
    this.backgroundColor = ColorManager.white,
    this.onTap,
    this.shadowColor,
    required this.child,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin:
            EdgeInsets.only(bottom: bottom, left: left, right: right, top: top),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius)),
        color: backgroundColor,
        shadowColor: shadowColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.paddingContainerHorizontal,
              vertical: AppPadding.paddingContainerVertical),
          child: child,
        ),
      ),
    );
  }
}
