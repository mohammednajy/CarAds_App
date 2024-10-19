import 'package:car_ads_app/core/router/router.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/theme/dark_theme.dart';
import 'package:car_ads_app/core/theme/light_theme.dart';
import 'package:car_ads_app/core/theme/theme_provider.dart';
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
      initialRoute: RoutesName.onboarding,
      theme: lightTheme,
    );
  }
}
