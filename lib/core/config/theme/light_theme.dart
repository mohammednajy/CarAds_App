import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
  // brightness: Brightness.light,
  scaffoldBackgroundColor: ColorManager.scaffoldColor,
  fontFamily: FontConstants.fontFamily,
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    brightness: Brightness.light,
    secondary: Colors.black,
  ),

  //----------------------------- ChipTheme ------------------------------

  chipTheme: const ChipThemeData(
      side: BorderSide.none,
      selectedColor: ColorManager.borderColor,
      disabledColor: ColorManager.white10,
      labelStyle: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.primary,
        fontWeight: FontWeight.w400,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.white10,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide.none,
      )),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    buttonColor: ColorManager.primary,
  ),
  //-----------------------------TextButtonTheme------------------------------

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(ColorManager.primary),
        textStyle: WidgetStateProperty.all(const TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.w400,
        ))),
  ),
  //------------------------------AppBarTheme---------------------------------

  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 70,
      elevation: 0,
      iconTheme: IconThemeData(
        size: FontSize.s28,
        color: ColorManager.primaryTextColor,
      ),
      centerTitle: false,
      // titleSpacing: 30,
      actionsIconTheme: IconThemeData(
        size: 25,
        color: ColorManager.primary,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: FontSize.s22,
        fontFamily: FontConstants.fontFamily,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryTextColor,
      )),

  //---------------------------ElevatedButtonTheme----------------------------

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // padding: const EdgeInsets.symmetric(vertical: 11),
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.primary10,
      disabledBackgroundColor: ColorManager.primary10,
      disabledForegroundColor: ColorManager.primary,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: FontSize.s16,
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

  //--------------------------InputDecorationTheme----------------------------

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      color: ColorManager.secondTextColor,
      fontSize: FontSize.s14,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: ColorManager.backGroundColor,
    contentPadding: const EdgeInsets.symmetric(
      vertical: AppPadding.paddingVerticalTextField,
      horizontal: AppPadding.paddingHorizontalTextField,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        borderSide: const BorderSide(color: Colors.transparent)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(
        color: ColorManager.warningColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(
        color: ColorManager.borderColor,
        width: 1,
      ),
    ),
  ),

  //------------------------------- TextTheme -------------------------------

  textTheme: const TextTheme(
    titleMedium: TextStyle(
        fontSize: FontSize.s18,
        color: ColorManager.primaryTextColor,
        fontWeight: FontWeight.w900),
    bodySmall: TextStyle(
        fontSize: FontSize.s12,
        color: ColorManager.infoColor,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.primaryTextColor,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.secondTextColor,
        fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(
        fontSize: FontSize.s28,
        color: ColorManager.primaryTextColor,
        fontWeight: FontWeight.w900),
  ),
);
