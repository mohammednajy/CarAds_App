import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/commonWidgets/popup_widget.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/auth/domain/providers/signUp_provider.dart';
import 'package:car_ads_app/features/auth/presentation/widget/country_phone_section.dart';
import 'package:car_ads_app/features/auth/presentation/widget/have_account_section.dart';
import 'package:car_ads_app/features/auth/presentation/widget/socail_media_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookConsumerWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();

    final bool showPassState = ref.watch(isShowProvider);
    ref.listen(signUpProvider, (p, n) {
      n.whenOrNull(data: (data) {
        context.navigateAndRemoveUntil(RoutesName.mainAppScreen, (_) => false);
        navigatorKey.currentContext!.showSnackBar(
            message: 'Login Success', backgroundColor: Colors.green);
      }, error: (error, stack) {
        context.showSnackBar(
            message: error.toString(), backgroundColor: Colors.red);
      });
    });
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
            key: signUpFormKey,
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
                    CountryAndPhoneSection(
                      phoneController: phoneController,
                      onSaved: (phone) {
                        phoneNumber = phone!.completeNumber;
                      },
                    ),
                    16.addVerticalSpace,
                    CustomTextField(
                      controller: passwordController,
                      validator: (val) => val!.validatePassword(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          ref
                              .read(isShowProvider.notifier)
                              .update((state) => !state);
                        },
                        child: showPassState
                            ? const Icon(Icons.visibility_off,
                                size: 18, color: ColorManager.primary)
                            : const Icon(Icons.visibility, size: 18),
                      ),
                      obscureText: showPassState,
                      hintText: LocaleKeys.password.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    ),
                    24.addVerticalSpace,
                    Consumer(builder: (context, ref, child) {
                      return CustomButtonWidget(
                        isLoading: ref.watch(signUpProvider).isLoading,
                        title: LocaleKeys.signUp.tr(),
                        onPressed: () {
                          if (signUpFormKey.currentState!.validate()) {
                            signUpFormKey.currentState!.save();
                            ref.read(signUpProvider.notifier).signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneNumber,
                                  fullName: nameController.text,
                                );
                          }
                        },
                      );
                    }),
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
