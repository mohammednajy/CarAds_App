import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/features/auth/domain/providers/reset_password_provider.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgetPasswordScreen extends HookConsumerWidget {
  ForgetPasswordScreen({super.key});

  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final emailController = useTextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
        visible: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Form(
          key: forgetFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.paddingHorizontal,
                vertical: MediaQuery.sizeOf(context).height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomSvgAssets(path: ImagePath.forgetImage),
                  16.addVerticalSpace,
                  Text(
                    LocaleKeys.forgotYourPassword.tr(),
                    style: context.titleMedium,
                  ),
                  4.addVerticalSpace,
                  Text(
                    LocaleKeys.noWorriesHelpYouResetYourPassword.tr(),
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
                  24.addVerticalSpace,
                  CustomButtonWidget(
                    isLoading: ref.watch(loginProvider).isLoading,
                    title: LocaleKeys.send.tr(),
                    onPressed: () {
                      if (forgetFormKey.currentState!.validate()) {
                        ref
                            .read(reSetPasswordProvider.notifier)
                            .reSetPassword(email: emailController.text.trim());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
