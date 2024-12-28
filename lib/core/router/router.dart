import 'package:car_ads_app/features/bnb/presentation/screens/main_app_screen.dart';
import 'package:car_ads_app/features/home/presentation/screens/all_cars_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/check_email_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/create_new_password.dart';
import 'package:car_ads_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/signIn_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:car_ads_app/features/auth/presentation/screens/signUp_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:car_ads_app/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/change_language_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/done_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/faq_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/payment_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/reset_password_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/terms_conditions_screen.dart';
import 'package:car_ads_app/features/profile/presentation/screens/update_profile_screen.dart';

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
    case RoutesName.mainAppScreen:
      var numPage = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => MainAppScreen(
                page: numPage,
              ),
          settings: const RouteSettings(name: RoutesName.mainAppScreen));
    case RoutesName.allCarsScreen:
      return MaterialPageRoute(
          builder: (context) => const AllCarsScreen(),
          settings: const RouteSettings(name: RoutesName.allCarsScreen));
    case RoutesName.signInScreen:
      return MaterialPageRoute(
        builder: (context) => SignInScreen(),
      );
    case RoutesName.signUpScreen:
      return MaterialPageRoute(
        builder: (context) => SignUpScreen(),
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
    case RoutesName.profileScreen:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
    case RoutesName.paymentScreen:
      return MaterialPageRoute(
        builder: (context) => const PaymentScreen(),
      );
    case RoutesName.changeLanguageScreen:
      return MaterialPageRoute(
        builder: (context) => const ChangeLanguageScreen(),
      );
    case RoutesName.fAQScreen:
      return MaterialPageRoute(
        builder: (context) => const FAQScreen(),
      );
    case RoutesName.termsAndConditionsScreen:
      return MaterialPageRoute(
        builder: (context) => TermsAndConditionsScreen(),
      );
    case RoutesName.privacyPolicyScreen:
      return MaterialPageRoute(
        builder: (context) => PrivacyPolicyScreen(),
      );
    case RoutesName.resetPasswordScreen:
      return MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(),
      );
    case RoutesName.doneScreen:
      return MaterialPageRoute(
        builder: (context) => const DoneScreen(),
      );
      case RoutesName.updateProfileScreen:
      return MaterialPageRoute(
        builder: (context) => const UpdateProfileScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Text('wrong path'),
      );
  }
}
