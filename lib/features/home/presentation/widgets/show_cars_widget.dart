import 'package:car_ads_app/core/commonWidgets/car_label_widget.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/layout_extensions.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowCarsWidget extends StatelessWidget {
  const ShowCarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: 20.spaceHorizontal,
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 200.height,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => MainCard(
                onTap: () {},
                vertical: 16,
                horizontal: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImagePath.carMedium,
                    ).center(),
                    Text(
                      'Toyota',
                      style: context.titleMedium.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '16K',
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' AED',
                          style: context.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(IconsPath.showRoomIcon),
                        3.addHorizontalSpace,
                        Text(
                          'Showroom Name',
                          style: context.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CarLabelWidget(
                          title: 'Automatic',
                        ),
                        SvgPicture.asset(IconsPath.toyotaIcon)
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
