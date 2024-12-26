import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class CardInProfileWidget extends StatelessWidget {
  const CardInProfileWidget({
    required this.title,
    this.onTap,
    this.isLogOut = false,
    super.key,
  });

  final void Function()? onTap;
  final String title;
  final bool isLogOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          tileColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          title: Text(
            title,
            style: context.bodyMedium,
          ),
          trailing: MainContainer(
            height: 22,
            width: 22,
            color: isLogOut ? ColorManager.warning10 : ColorManager.primary10,
            child: CustomSvgAssets(
                path: isLogOut ? IconsPath.logout : IconsPath.nextIcon),
          ),
        ),
        isLogOut
            ? const SizedBox()
            : const Divider(color: ColorManager.dividerColor),
      ],
    );
  }
}
