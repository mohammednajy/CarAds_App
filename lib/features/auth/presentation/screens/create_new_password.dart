import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
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
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  bool visibility = true;

  isVisibility() {
    setState(() {
      visibility = !visibility;
    });
  }

  bool visibility2 = true;

  isVisibility2() {
    setState(() {
      visibility2 = !visibility2;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          key: newPasswordFormKey,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.paddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomSvgAssets(path: ImagePath.newPasswordImage),
                16.addVerticalSpace,
                Text(
                  LocaleKeys.createNewPassword.tr(),
                  style: context.titleMedium,
                ),
                4.addVerticalSpace,
                Text(
                  LocaleKeys.yourNewPasswordMustBeDifferent.tr(),
                  textAlign: TextAlign.center,
                  style: context.bodyMedium,
                ),
                32.addVerticalSpace,
                CustomTextField(
                  controller: passwordController,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisibility();
                    },
                    child: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                            color: ColorManager.backGroundColor,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: visibility,
                  hintText: LocaleKeys.newPassword.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                16.addVerticalSpace,
                CustomTextField(
                  controller: confirmPasswordController,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisibility2();
                    },
                    child: visibility2
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: visibility2,
                  hintText: LocaleKeys.confirmPassword.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                24.addVerticalSpace,
                CustomButtonWidget(
                  title: LocaleKeys.confirm.tr(),
                  onPressed: () {
                    if (newPasswordFormKey.currentState!.validate()) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        context.navigateAndRemoveUntil(
                            RoutesName.signInScreen, (_) => false);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
