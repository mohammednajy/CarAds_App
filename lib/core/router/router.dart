import 'package:car_ads_app/features/auth/presentation/screens/login_screen.dart';
import 'package:car_ads_app/features/bnb/presentation/screens/main_app_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/splash_screen.dart';

import 'routes_name.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.splash:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: const RouteSettings(name: RoutesName.splash));
    case RoutesName.onboarding:
      return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: const RouteSettings(name: RoutesName.onboarding));
    case RoutesName.login:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(name: RoutesName.login));
    case RoutesName.mainAppScreen:
      return MaterialPageRoute(
          builder: (context) => const MainAppScreen(),
          settings: const RouteSettings(name: RoutesName.mainAppScreen));
    default:
      return MaterialPageRoute(
        builder: (context) => const Text('wrong path'),
      );
  }
}
