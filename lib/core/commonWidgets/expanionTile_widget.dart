import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.title,
    this.text = '',
    this.collapsedBackgroundColor = ColorManager.white,
  });

  final String title;
  final String text;
  final Color collapsedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      // tilePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      collapsedBackgroundColor: collapsedBackgroundColor,
      title: Text(
        title,
        style: context.titleMedium,
      ),
      trailing: const MainContainer(
        height: 22,
        width: 22,
        child: CustomSvgAssets(
          path: IconsPath.arrowDown,
        ),
      ),
      children: [
        Text(text, style: context.bodySmall),
      ],
    );
  }
}
