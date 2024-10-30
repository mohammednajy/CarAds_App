// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_ads_app/core/utils/resources/images_constant.dart';

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
    title: 'Welcome to CarAds App',
    description: '''
 CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you're a car showroom owner or looking to rent a vehicle, our platform has got you covered!
''',
    imagePath: ImagePath.onboarding1,
  ),
  OnboardingModel(
    title: 'Effortless Ads Management',
    description: '''
Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds
''',
    imagePath: ImagePath.onboarding2,
  ),
  OnboardingModel(
    title: 'Explore Your Options',
    description: '''
Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds
''',
    imagePath: ImagePath.onboarding3,
  ),
];
