import 'package:car_ads_app/core/commonWidgets/CustomSvg.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/utils/resources/icons_constant.dart';
import 'package:car_ads_app/core/utils/resources/style_manger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconAction,
    this.onTap,
    this.visible = false,
  });

  final String title;
  final String? iconAction;
  final void Function()? onTap;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: color,
      elevation: 0,
      centerTitle: true,
      leading: visible == true
          ? GestureDetector(
              onTap: () {
                context.goBack(true);
              },
              child: MainContainer(
                left: 6,
                right: 6,
                top: 13,
                bottom: 13,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: CustomSvgAssets(
                  path: AppIcons.back,
                ),
              ),
            )
          : const SizedBox(),
      title: Text(
        title.tr(),
        maxLines: 2,
        style: StyleManger.headLineBar(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}