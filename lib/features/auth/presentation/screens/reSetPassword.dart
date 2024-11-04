import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/material.dart';


class ReSetPasswordScreen extends StatelessWidget {
  ReSetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

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
          // key: value.reSetPasswordFormKey,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.paddingHorizontal,),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  const CustomSvgAssets(
                    path: IconsPath.iconsPath,
                    width: 46,
                    height: 44,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Reset password',
                    style: TextStyle(
                      fontSize: FontSize.s22,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Enter the email associated with your account and we’ll send an email with instructions to reset your password!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.s15,
                      color: ColorManager.secondTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: emailController,
                    validator: (val) => val!.validateEmail(),
                    hintText: 'email',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 55,
        child:  Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.paddingHorizontal,),
          child: CustomButtonWidget(
            // isLoading: value.isLoadingReSet,
            title: 'sendOTP',
            onPressed: () {
              // value.reSetPassword(email: emailController.text.trim());
            },
          ),
        ),
      ),
    );
  }
}
