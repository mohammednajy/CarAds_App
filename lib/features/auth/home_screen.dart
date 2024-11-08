import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class HomeScreenTest extends StatelessWidget {
  const HomeScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome in Home page',
          style: context.titleMedium,
        ),
      ),
    );
  }
}
