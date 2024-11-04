import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
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
                horizontal: AppPadding.paddingHorizontal,),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1
                ),
                const CustomSvgAssets(
                  path: IconsPath.iconsPath,
                  width: 46,
                  height: 44,
                  // color: ColorManager.black,
                ),
                const SizedBox(height: 11),
                const Text(
                  'createNewPassword',
                  style: TextStyle(
                    fontSize: FontSize.s22,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your new password must be different from previous used passwords.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s15,
                    color: ColorManager.secondTextColor,
                  ),
                ),
                const SizedBox(height: 24),
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
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: true,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
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
                  obscureText: true,
                  hintText: 'confirmPassword',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.paddingHorizontal),
        child: CustomButtonWidget(
          title: 'confirm',
          onPressed: () {
            if (newPasswordFormKey.currentState!.validate()) {
              if (passwordController.text == confirmPasswordController.text) {
                // sl<AppRouter>()
                //     .goToAndRemove(screenName: ScreenName.loginScreen);
              }
            }
          },
        ),
      ),
    );
  }
}
