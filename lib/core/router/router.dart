import 'routes_name.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.onboarding:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Text('wrong path'),
      );
  }
}
