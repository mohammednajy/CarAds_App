import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  // Define additional dark theme properties here
  scaffoldBackgroundColor: ColorManager.primary,
  fontFamily: FontConstants.fontFamily,
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    buttonColor: ColorManager.white,
  ),
  //-----------------------------TextButtonTheme------------------------------

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(ColorManager.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.w400,
          color: ColorManager.white,
        ),
      ),
    ),
  ),

  //---------------------------ElevatedButtonTheme----------------------------
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // padding: const EdgeInsets.symmetric(vertical: 11),
      backgroundColor: ColorManager.borderColor,
      foregroundColor: ColorManager.primary10,
      disabledBackgroundColor: ColorManager.primary10,
      disabledForegroundColor: ColorManager.primary,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
        fontFamily: FontConstants.fontFamily,
        fontWeight: FontWeight.w800,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      minimumSize: const Size(double.infinity, 48),
      maximumSize: const Size(double.infinity, 48),
    ),
  ),

  //------------------------------- TextTheme -------------------------------

  textTheme: const TextTheme(
    titleMedium: TextStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
        fontWeight: FontWeight.w900),
    bodySmall: TextStyle(
        fontSize: FontSize.s12,
        color: ColorManager.white,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.white,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.white,
        fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(
        fontSize: FontSize.s28,
        color: ColorManager.white,
        fontWeight: FontWeight.w900),
  ),
);
