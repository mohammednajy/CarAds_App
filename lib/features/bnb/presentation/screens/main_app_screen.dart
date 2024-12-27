import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/features/bnb/data/models/main_screen_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppScreen extends HookWidget {
  const MainAppScreen({
    super.key,
    required this.page,
  });

  final int page;

  @override
  Widget build(BuildContext context) {
    final index = useState(page);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: tabs[index.value].screen,
      bottomNavigationBar: Stack(
        alignment: alignments[index.value],
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: buildNavBarItems(),
            onTap: (value) {
              index.value = value;
            },
            currentIndex: index.value,
          ),
          Container(
            margin: marginContainer(index.value, screenWidth),
            alignment: Alignment.center,
            height: 5,
            width: screenWidth / 6,
            color: ColorManager.primary,
          ),
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> buildNavBarItems() {
    return tabs
        .map((e) => BottomNavigationBarItem(
              icon: SvgPicture.asset(e.tabIcon),
              label: e.tabTitle.tr(),
              activeIcon: SvgPicture.asset(e.activeIcon),
            ))
        .toList();
  }

  static const alignments = [
    AlignmentDirectional.topStart,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.topEnd,
  ];

  EdgeInsetsGeometry marginContainer(int index, double screenWidth) {
    if (index == 3) {
      return EdgeInsetsDirectional.only(start: screenWidth / 2.5);
    } else if (index == 1) {
      return EdgeInsetsDirectional.only(end: screenWidth / 2.5);
    }
    return const EdgeInsets.symmetric(horizontal: 5);
  }
}
