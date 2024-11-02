import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TopRatedShowroomWidget extends StatelessWidget {
  const TopRatedShowroomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.addVerticalSpace,
        Text(
          'Top rated Showroom',
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 136.height,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => MainCard(
              horizontal: 10,
              vertical: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImagePath.showRoom,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  // 4.addVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Showroom Name',
                        style: context.bodyMedium,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          IconsPath.shareIcon,
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                  // 4.addVerticalSpace,
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorManager.yellowSecondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '4.5 ',
                          style: TextStyle(fontSize: 8),
                        ),
                        Icon(
                          Icons.star,
                          color: ColorManager.yellowPrimary,
                          size: 10.height,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
