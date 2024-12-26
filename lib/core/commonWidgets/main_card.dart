import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String? subtitle;
  final Color backgroundColor;

  final Color? shadowColor;
  final VoidCallback? onTap;
  final Widget child;
  final double top;
  final double bottom;
  final double start;
  final double end;
  final double horizontal;
  final double vertical;
  final double border;
  final double elevation;

  const MainCard({
    super.key,
    this.subtitle,
    this.backgroundColor = ColorManager.white,
    this.onTap,
    this.shadowColor,
    required this.child,
    this.top = 0,
    this.bottom = 0,
    this.start = 0,
    this.end = 0,
    this.horizontal = 0,
    this.vertical = 0,
    this.border = AppSize.borderRadius,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsetsDirectional.only(
            bottom: bottom, start: start, end: end, top: top),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border)),
        shadowColor: shadowColor,
        elevation: elevation,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}