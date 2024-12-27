import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/commonWidgets/popup_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/profile/domain/provider/reset_password_provider.dart';
import 'package:car_ads_app/features/profile/presentation/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  ResetPasswordScreen({super.key});

  final GlobalKey<FormState> reSetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final bool showCurrentPassState = ref.watch(showCurrentPassProvider);
    final bool showNewPassState = ref.watch(showNewPassProvider);
    final bool showConfirmPassState = ref.watch(showConfirmPassProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Reset Your Password '),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Form(
          key: reSetPasswordFormKey,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.paddingHorizontal,
                vertical: AppPadding.paddingVertical),
            child: Column(
              spacing: 24,
              children: [
                CustomTextField(
                  controller: currentPasswordController,
                  hintText: 'Current password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      ref
                          .read(showCurrentPassProvider.notifier)
                          .update((state) => !state);
                    },
                    child: showCurrentPassState
                        ? const Icon(Icons.visibility_off,
                            size: 18, color: ColorManager.primary)
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: showCurrentPassState,
                ),
                const Divider(color: ColorManager.dividerColor),
                CustomTextField(
                  controller: newPasswordController,
                  hintText: 'New password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      ref
                          .read(showNewPassProvider.notifier)
                          .update((state) => !state);
                    },
                    child: showNewPassState
                        ? const Icon(Icons.visibility_off,
                            size: 18, color: ColorManager.primary)
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: showNewPassState,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      ref
                          .read(showConfirmPassProvider.notifier)
                          .update((state) => !state);
                    },
                    child: showConfirmPassState
                        ? const Icon(Icons.visibility_off,
                            size: 18, color: ColorManager.primary)
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: showConfirmPassState,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        buttonText: 'Reset Your Password',
        onPressed: () {
          if (reSetPasswordFormKey.currentState!.validate()) {
            if (newPasswordController.text == confirmPasswordController.text) {
              context.navigateTo(RoutesName.doneScreen);
            } else {
              context.showSnackBar(
                message: 'There is no match in entering the password',
                backgroundColor: ColorManager.warningColor,
              );
            }
          }
        },
      ),
    );
  }
}
