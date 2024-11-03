import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.iconAction,
      this.onTap,
      this.visible = true,
      this.actionIcon,
      this.textStyle});

  final String title;
  final String? iconAction;
  final void Function()? onTap;
  final bool visible;
  final List<Widget>? actionIcon;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: visible == true ? 42 : 0,
      leading: visible == true
          ? GestureDetector(
              onTap: () => context.goBack(),
              child: const MainCard(
                top: 15,
                bottom: 15,
                child: CustomSvgAssets(
                  path: IconsPath.back,
                ),
              ),
            )
          : const SizedBox(),
      title: Text(
        title.tr(),
        style: textStyle ?? context.headlineMedium.copyWith(fontSize: 22),
      ),
      actions: actionIcon,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
