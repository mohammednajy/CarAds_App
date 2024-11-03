import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';

import 'core/router/router.dart';
import 'core/router/routes_name.dart';
import 'core/config/theme/dark_theme.dart';
import 'core/config/theme/light_theme.dart';
import 'core/config/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarAdsApp extends ConsumerWidget {
  const CarAdsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(themeManagerProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        darkTheme: darkTheme,
        themeMode: themeManager,
        onGenerateRoute: onGenerateRoute,
        initialRoute: RoutesName.allCarsScreen,
        theme: lightTheme,
        navigatorKey: navigatorKey);
  }
}
