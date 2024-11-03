import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/features/home/presentation/widgets/filter_widget.dart';
import 'package:car_ads_app/features/home/presentation/widgets/show_cars_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllCarsScreen extends HookConsumerWidget {
  const AllCarsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'All Cars',
      ),
      body: Column(
        children: [
          10.addVerticalSpace,
          const FilterWidget(),
          16.addVerticalSpace,
          const ShowCarsWidget(),
        ],
      ),
    );
  }
}
