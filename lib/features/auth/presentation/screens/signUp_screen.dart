import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/auth/presentation/widget/have_account_section.dart';
import 'package:car_ads_app/features/auth/presentation/widget/socail_media_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool selected = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: Form(
            // key: value.signUpFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppPadding.paddingHorizontal,
                ),
                child: Column(
                  children: [
                    const CustomSvgAssets(
                      path: ImagePath.carYallow,
                    ),
                    16.addVerticalSpace,
                    Text(
                      LocaleKeys.joinCarAdsToday.tr(),
                      style: context.titleMedium,
                    ),
                    4.addVerticalSpace,
                    Text(
                      LocaleKeys.createYourAccountAndBecome.tr(),
                      textAlign: TextAlign.center,
                      style: context.bodyMedium,
                    ),
                    32.addVerticalSpace,
                    CustomTextField(
                      validator: (val) => val!.validateUserName(),
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      hintText: LocaleKeys.fullName.tr(),
                      keyboardType: TextInputType.name,
                    ),
                    16.addVerticalSpace,
                    CustomTextField(
                      controller: emailController,
                      validator: (val) => val!.validateEmail(),
                      hintText: LocaleKeys.emailAddress.tr(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    16.addVerticalSpace,
                    CustomTextField(
                      controller: phoneController,
                      validator: (val) => val!.validatePhoneNumber(),
                      hintText: LocaleKeys.phoneNumber.tr(),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    16.addVerticalSpace,
                    CustomTextField(
                      controller: passwordController,
                      validator: (val) => val!.validatePassword(),
                      // suffixIcon: GestureDetector(
                      //   onTap: () {
                      //     // value.isVisibility();
                      //   },
                      //   child: value.visibility
                      //       ? const Icon(
                      //     Icons.visibility_off,
                      //     size: 18,
                      //     color: ColorManager.primary,
                      //   )
                      //       : const Icon(Icons.visibility, size: 18),
                      // ),
                      // obscureText: value.visibility,
                      hintText: LocaleKeys.password.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    ),
                    24.addVerticalSpace,
                    CustomButtonWidget(
                      // isLoading: value.isLoading,
                      title: LocaleKeys.signUp.tr(),
                      onPressed: () {
                        // value.signUp(
                        //   name: nameController.text,
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        //   phone: phoneController.text,
                        // );
                      },
                    ),
                    32.addVerticalSpace,
                    const SocialMediaWidget(),
                    16.addVerticalSpace,
                    HaveAccountSection(
                      onTap: () {
                        context.navigateAndRemoveUntil(
                            RoutesName.signInScreen, (_) => false);
                      },
                      span1: LocaleKeys.alreadyHaveAccount.tr(),
                      span2: LocaleKeys.signIn.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
