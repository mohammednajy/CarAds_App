import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.paddingHorizontal,
              vertical: MediaQuery.sizeOf(context).height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                const Text(
                  'welcomeToProFitness',
                  style: TextStyle(
                    fontSize: FontSize.s24,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 11),
                const Text(
                  'enterYourEmail',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: emailController,
                  validator: (val) => val!.validateEmail(),
                  hintText: 'email',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: passwordController,
                  // suffixIcon: GestureDetector(
                  //   onTap: () {
                  //     // value.isVisibility();
                  //   },
                  //   child:
                  //   value.visibility
                  //       ? const Icon(Icons.visibility_off,
                  //       size: 18, color: ColorManager.primary)
                  //       : const Icon(Icons.visibility, size: 18),
                  // ),
                  // validator: (val) => val!.validatePassword(),
                  // obscureText: value.visibility,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // sl<AppRouter>()
                      //     .goTo(screenName: ScreenName.reSetPasswordScreen);
                    },
                    child: const Text(
                      'forgetPassword',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButtonWidget(
                  // isLoading: value.isLoading,
                  title: 'logIn',
                  fontWeight: FontWeight.w700,
                  fontSize: FontSize.s20,
                  onPressed: () {
                    // value.login(
                    //   email: emailController.text,
                    //   password: passwordController.text,
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
                // const SizedBox(height: 16),
                // CustomButtonWidget(
                //   // isLoading: value.isLoadingSignInWithGoogle,
                //   loadingColor: ColorManager.primary,
                //   showIcon: true,
                //   // icon: AppIcons.google,
                //   title: 'connectWithGoogle',
                //   fontWeight: FontWeight.w600,
                //   textColor: ColorManager.primaryTextColor,
                //   fontSize: FontSize.s14,
                //   onPressed: () {
                //     // value.signInWithGoogle();
                //   },
                //   // style:
                //   // Theme.of(context).elevatedButtonTheme.style?.copyWith(
                //   //   backgroundColor: const WidgetStatePropertyAll(
                //   //       ColorManager.black,
                //   //   ),
                //   //   side: const WidgetStatePropertyAll(
                //   //     BorderSide(
                //   //         width: 1.0,
                //   //         color: ColorManager.borderColor),
                //   //   ),
                //   // ),
                // ),
                // const SizedBox(height: 8),
                // CustomButtonWidget(
                //   // isLoading: value.isLoading,
                //   showIcon: true,
                //   // icon: AppIcons.facebook,
                //   title: 'connectWithFacebook',
                //   fontWeight: FontWeight.w600,
                //   fontSize: FontSize.s14,
                //   onPressed: () {},
                // ),
                const SizedBox(height: 42),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      // sl<AppRouter>()
                      //     .goTo(screenName: ScreenName.signUpScreen);
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
                            text: 'signUp',
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
      ),
    );
  }
}
