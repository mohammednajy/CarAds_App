import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/config/theme/theme_provider.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/features/home/presentation/widgets/body_home_widget.dart';
import 'package:car_ads_app/features/home/presentation/widgets/top_rated_showroom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Welcome Ahmed',
        visible: false,
        textStyle: context.headlineMedium,
        actionIcon: [
          MainCard(
            end: 20,
            onTap: () {
              ref.read(themeManagerProvider.notifier).toggleTheme();
              print('go to notification screen');
            },
            horizontal: 10,
            vertical: 10,
            child: SvgPicture.asset(IconsPath.notificationIcon),
          )
        ],
      ),
      body: ListView(
        padding: 20.spaceHorizontal,
        children: const [
          BodyHomeCard(),
          TopRatedShowroomWidget(),
        ],
      ),
    );
  }
}
