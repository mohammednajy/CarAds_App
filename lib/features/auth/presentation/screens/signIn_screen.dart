import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_facebook_provider.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_google_provider.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:car_ads_app/features/auth/presentation/widget/have_account_section.dart';
import 'package:car_ads_app/features/auth/presentation/widget/socail_media_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final bool showPassState = ref.watch(showPassProvider);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Form(
          key: loginFormKey,
          child: Center(
            child: ref.watch(signInWithGoogleProvider).isLoading ||
                    ref.watch(signInWithFacebookProvider).isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: AppPadding.paddingHorizontal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomSvgAssets(
                            path: ImagePath.carYallow,
                          ),
                          16.addVerticalSpace,
                          Text(
                            LocaleKeys.welcomeBackToCarAds.tr(),
                            style: context.titleMedium,
                          ),
                          4.addVerticalSpace,
                          Text(
                            LocaleKeys.signInToYourAccountAndGetBack.tr(),
                            textAlign: TextAlign.center,
                            style: context.bodyMedium,
                          ),
                          32.addVerticalSpace,
                          CustomTextField(
                            controller: emailController,
                            validator: (val) => val!.validateEmail(),
                            hintText: LocaleKeys.emailAddress.tr(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          16.addVerticalSpace,
                          CustomTextField(
                            controller: passwordController,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                ref
                                    .read(showPassProvider.notifier)
                                    .update((state) => !state);
                              },
                              child: showPassState
                                  ? const Icon(Icons.visibility_off,
                                      size: 18, color: ColorManager.primary)
                                  : const Icon(Icons.visibility, size: 18),
                            ),
                            validator: (val) => val!.validatePassword(),
                            obscureText: showPassState,
                            hintText: LocaleKeys.password.tr(),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                              onPressed: () {
                                context.navigateTo(
                                    RoutesName.forgetPasswordScreen);
                              },
                              child: Text(
                                LocaleKeys.forgotYourPassword.tr(),
                                style: context.bodySmall,
                              ),
                            ),
                          ),
                          16.addVerticalSpace,
                          Consumer(
                            builder: (context, ref, child) =>
                                CustomButtonWidget(
                              isLoading: ref.watch(loginProvider).isLoading,
                              title: LocaleKeys.signIn.tr(),
                              onPressed: () async {
                                if (loginFormKey.currentState!.validate()) {
                                  ref.read(loginProvider.notifier).signIn(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                          ),
                          32.addVerticalSpace,
                          const SocialMediaWidget(),
                          16.addVerticalSpace,
                          HaveAccountSection(
                            onTap: () {
                              context.navigateTo(RoutesName.signUpScreen);
                            },
                            span1: LocaleKeys.dontHaveAccount.tr(),
                            span2: LocaleKeys.signUp.tr(),
                          )
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

//  Accounts you can signIn them
// test@test.com
//123@Test
