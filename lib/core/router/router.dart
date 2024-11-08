import 'package:car_ads_app/features/auth/home_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/check_email_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/create_new_password.dart';
import 'package:car_ads_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/signIn_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/signUp_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/splash_screen.dart';

import 'routes_name.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.splash:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case RoutesName.onboarding:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
    case RoutesName.signInScreen:
      return MaterialPageRoute(
        builder: (context) =>  SignInScreen(),
      );
    case RoutesName.signUpScreen:
      return MaterialPageRoute(
        builder: (context) =>  SignUpScreen(),
      );
    case RoutesName.checkEmailScreen:
      return MaterialPageRoute(
        builder: (context) => const CheckEmailScreen(),
      );
    case RoutesName.forgetPasswordScreen:
      return MaterialPageRoute(
        builder: (context) => ForgetPasswordScreen(),
      );
    case RoutesName.createNewPasswordScreen:
      return MaterialPageRoute(
        builder: (context) => const CreateNewPasswordScreen(),
      );
      case RoutesName.oTPScreen:
      return MaterialPageRoute(
        builder: (context) => const OTPScreen(),
      );
      case RoutesName.homeScreenTest:
      return MaterialPageRoute(
        builder: (context) => const HomeScreenTest(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Text('wrong path'),
      );
  }
}
