import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/features/bnb/data/models/main_screen_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppScreen extends HookWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    return Scaffold(
      body: tabs[index.value].screen,
      bottomNavigationBar: Stack(
        alignment: indicatorLocation(index.value),
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: tabs
                .map(
                  (e) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        e.tabIcon,
                      ),
                      label: e.tabTitle.tr(),
                      activeIcon: SvgPicture.asset(
                        e.activeIcon,
                      )),
                )
                .toList(),
            onTap: (value) {
              index.value = value;
            },
            currentIndex: index.value,
          ),
          Container(
            margin: marginContainer(index.value, context),
            alignment: Alignment.center,
            height: 5,
            width: MediaQuery.sizeOf(context).width / 6,
            color: ColorManager.primary,
          ),
        ],
      ),
    );
  }

  AlignmentGeometry indicatorLocation(int index) {
    if (index == 0) {
      return AlignmentDirectional.topStart;
    } else if (index == 4) {
      return AlignmentDirectional.topEnd;
    } else {
      return AlignmentDirectional.topCenter;
    }
  }

  EdgeInsetsGeometry marginContainer(int index, BuildContext context) {
    if (index == 3) {
      return EdgeInsetsDirectional.only(
          start: MediaQuery.sizeOf(context).width / 2.5);
    } else if (index == 1) {
      return EdgeInsetsDirectional.only(
          end: MediaQuery.sizeOf(context).width / 2.5);
    }
    return const EdgeInsets.symmetric(horizontal: 5);
  }
}
