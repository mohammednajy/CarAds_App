import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterWidget extends HookConsumerWidget {
  const FilterWidget({
    super.key,
  });
  static const carsCompany = [
    {"name": "Toyota", "logo": IconsPath.toyotaIcon},
    {"name": "Audi", "logo": IconsPath.audiIcon},
    {"name": "Mazda", "logo": IconsPath.mazdaIcon},
    {"name": "BMW", "logo": IconsPath.bmwIcon},
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    return SizedBox(
      height: 40.height,
      child: ListView.separated(
        separatorBuilder: (context, index) => 10.addHorizontalSpace,
        padding: 20.spaceHorizontal,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => ChoiceChip(
          onSelected: (value) {
            selectedIndex.value = index;
          },
          label: Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(carsCompany[index]["logo"]!,
                    colorFilter: ColorFilter.mode(
                        index == selectedIndex.value
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn)),
                4.addHorizontalSpace,
                Text(carsCompany[index]["name"]!),
              ],
            ),
          ),
          selected: selectedIndex.value == index,
          showCheckmark: false,
        ),
      ),
    );
  }
}
