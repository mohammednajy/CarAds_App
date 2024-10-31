// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;
  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: LocaleKeys.onboardingTitle1,
    description: LocaleKeys.onboardingDescription1,
    imagePath: ImagePath.onboarding1,
  ),
  OnboardingModel(
    title: LocaleKeys.onboardingTitle2,
    description: LocaleKeys.onboardingDescription2,
    imagePath: ImagePath.onboarding2,
  ),
  OnboardingModel(
    title: LocaleKeys.onboardingTitle3,
    description: LocaleKeys.onboardingDescription3,
    imagePath: ImagePath.onboarding3,
  ),
];
