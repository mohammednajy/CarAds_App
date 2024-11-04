import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
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
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child:Form(
          // key: value.signUpFormKey,
          child: ListView(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.paddingHorizontal),
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
              const SizedBox(height: 8),
              const Text(
                'createAccounts',
                style: TextStyle(
                  fontSize: FontSize.s30,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'pleaseEnterYourCredentials',
                style: TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.primaryTextColor,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                validator: (val) => val!.validateUserName(),
                textInputAction: TextInputAction.next,
                controller: nameController,
                hintText: 'userName',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: emailController,
                validator: (val) => val!.validateEmail(),
                hintText: 'email',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: phoneController,
                validator: (val) => val!.validatePhoneNumber(),
                hintText: 'phone',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 14),
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
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30),
              CustomButtonWidget(
                // isLoading: value.isLoading,
                title: 'signUp',
                fontWeight: FontWeight.w700,
                onPressed: () {
                  // value.signUp(
                  //   name: nameController.text,
                  //   email: emailController.text,
                  //   password: passwordController.text,
                  //   phone: phoneController.text,
                  // );
                },
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'orLoginWith',
                  // style: StyleManger.bodyText(),
                ),
              ),
              const SizedBox(height: 16),
              CustomButtonWidget(
                // isLoading: login.isLoadingSignInWithGoogle,
                loadingColor: ColorManager.primary,
                showIcon: true,
                // icon: IconsPath.iconsPath.google,
                title: 'connectWithGoogle',
                fontWeight: FontWeight.w600,
                textColor: ColorManager.primaryTextColor,
                fontSize: FontSize.s14,
                onPressed: () {
                  // login.signInWithGoogle();
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: const WidgetStatePropertyAll(
                      ColorManager.black),
                  side: const WidgetStatePropertyAll(
                    BorderSide(
                        width: 1.0, color: ColorManager.borderColor),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomButtonWidget(
                // isLoading: value.isLoading,
                showIcon: true,
                // icon: IconsPath.facebook,
                title: 'connectWithFacebook',
                fontWeight: FontWeight.w600,
                fontSize: FontSize.s14,
                onPressed: () {},
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: const WidgetStatePropertyAll(
                        ColorManager.black)),
              ),
              const SizedBox(height: 42),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    // sl<AppRouter>().goTo(screenName: ScreenName.loginScreen);
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'haveAnAccount',
                          style: TextStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.secondTextColor,
                          ),
                        ),
                        TextSpan(
                          text: 'logIn',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
