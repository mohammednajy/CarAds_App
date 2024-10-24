import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/utils/resources/font_size.dart';
import 'package:flutter/material.dart';


class StyleManger {
  static TextStyle headline1({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s28,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      );

  static TextStyle headline2({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s22,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle headline3({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s16,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle headline4({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s14,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodyText({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s12,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );
  static TextStyle bodyText2({
    Color color = ColorManager.secondTextColor,
    double fontSize = FontSize.s14,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle headLineBar({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s28,
  }) =>
      TextStyle(
          fontFamily: "Bebas",
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5);
}
