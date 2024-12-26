// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/features/bnb/presentation/screens/add_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:car_ads_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreenModel {
  final String tabTitle;
  final String tabIcon;
  final String activeIcon;
  final Widget screen;
  MainScreenModel({
    required this.tabTitle,
    required this.tabIcon,
    required this.screen,
    required this.activeIcon,
  });
}

List<MainScreenModel> tabs = [
  MainScreenModel(
      tabTitle: LocaleKeys.home,
      tabIcon: IconsPath.homeIcon,
      screen: const HomeScreen(),
      activeIcon: IconsPath.homeActiveIcon),
  MainScreenModel(
      tabTitle: LocaleKeys.explore,
      tabIcon: IconsPath.exploreIcon,
      screen: const Text('explore'),
      activeIcon: IconsPath.exploreActiveIcon),
  MainScreenModel(
      tabTitle: LocaleKeys.add,
      tabIcon: IconsPath.addIcon,
      screen: const AddScreen(),
      activeIcon: IconsPath.addActiveIcon),
  MainScreenModel(
      tabTitle: LocaleKeys.history,
      tabIcon: IconsPath.historyIcon,
      screen: const Text('history'),
      activeIcon: IconsPath.historyActiveIcon),
  MainScreenModel(
      tabTitle: LocaleKeys.profile,
      tabIcon: IconsPath.profileIcon,
      screen: const ProfileScreen(),
      activeIcon: IconsPath.profileActiveIcon),
];
