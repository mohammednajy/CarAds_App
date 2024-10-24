import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/utils/resources/icons_constant.dart';
import 'package:car_ads_app/core/utils/resources/sizes_in_app.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: AppBar(
        leadingWidth: visible == true ? AppSize.s42 : 0,
        leading: visible == true
            ? GestureDetector(
                onTap: () => context.goBack(),
                child: MainContainer(
                  top: AppSize.s15,
                  bottom: AppSize.s15,
                  color: ColorManager.white,
                  alignment: Alignment.center,
                  child: CustomSvgAssets(
                    path: AppIcons.back,
                  ),
                ),
              )
            : const SizedBox(),
        title: Text(
          title.tr(),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(AppSize.s70);
}
