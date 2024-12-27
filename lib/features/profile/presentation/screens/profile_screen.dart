import 'package:car_ads_app/core/commonWidgets/bottom_sheet_widget.dart';
import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/commonWidgets/netowrk_image_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/profile/presentation/widgets/card_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = SharedPrefController.getUserData();
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Your Profile',
          visible: false,),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.paddingHorizontal),
          children: [
            ListTile(
              tileColor: ColorManager.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius)),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  child: NetworkImageWidget(
                    image: userData.image,
                    height: 50.height,
                  ),
                ),
              ),
              title: Text(
                userData.name,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w900),
              ),
              subtitle: Text(userData.phone,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: context.bodyMedium
                      .copyWith(color: ColorManager.primary70)),
              trailing: const MainContainer(
                height: 42,
                width: 42,
                child: CustomSvgAssets(path: IconsPath.pensel),
              ),
            ),
            32.addVerticalSpace,
            MainCard(
              child: Column(
                children: [
                  CardInProfileWidget(
                    title: 'Payment Methods',
                    onTap: () {
                      context.navigateTo(RoutesName.paymentScreen);
                    },
                  ),
                  const CardInProfileWidget(title: 'Change Your Email '),
                  const CardInProfileWidget(title: 'Change Your Phone Number '),
                   CardInProfileWidget(title: 'Change Your Password ',onTap: (){
                    context.navigateTo(RoutesName.resetPasswordScreen);
                  },),
                  CardInProfileWidget(
                    title: 'Change Language ',
                    onTap: () {
                      context.navigateTo(RoutesName.changeLanguageScreen);
                    },
                  ),
                  CardInProfileWidget(
                    title: 'FAQ’S',
                    onTap: () {
                      context.navigateTo(RoutesName.fAQScreen);
                    },
                  ),
                   CardInProfileWidget(title: 'Privacy Policy',onTap: (){
                    context.navigateTo(RoutesName.privacyPolicyScreen);
                  },),
                  CardInProfileWidget(
                    title: 'Terms & Conditions',
                    onTap: () {
                      context.navigateTo(RoutesName.termsAndConditionsScreen);
                    },
                  ),
                  CardInProfileWidget(
                    title: 'Logout',
                    isLogOut: true,
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => BottomSheetWidget(
                          title: 'Logout ',
                          body: Column(
                            spacing: 24,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomSvgAssets(
                                path: ImagePath.logoutFrame,
                              ),
                              Text(
                                'Are you sure you want to log out?',
                                style: context.bodyMedium,
                              )
                            ],
                          ),
                          primaryButtonText: 'YES , LOGOUT',
                          secondaryButtonText: 'NO , I CHANGED MY MIND !',
                          onPressedButton: () {},
                          onPressedTextButton: () {
                            context.goBack();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            16.addVerticalSpace,
          ],
        ),
      ),
    );
  }
}
