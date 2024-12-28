import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/commonWidgets/main_card.dart';
import 'package:car_ads_app/core/commonWidgets/netowrk_image_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/profile/presentation/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfileScreen extends HookConsumerWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Update Your Profile '),
      body: Form(
        key: updateProfileFormKey,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.paddingHorizontal,
            ),
            child: Column(
              spacing: 16,
              children: [
                MainCard(
                    vertical: 16,
                    onTap: () {
                      /*
                      _showPicker(
                    context: context,
                    onTapGallery: () {
                      value.imgFromGallery();
                    },
                    onTapCamera: () {
                      value.imgFromCamera();
                    },
                  );
                       */
                    },
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppSize.borderRadius),
                            child: NetworkImageWidget(
                              image: SharedPrefController.getUserData().image,
                              height: 50.height,
                            ),
                          ),
                        ),
                        Text(
                          'Upload New Picture',
                          textAlign: TextAlign.center,
                          style: context.bodyMedium
                              .copyWith(color: ColorManager.info90),
                        )
                      ],
                    )),
                CustomTextField(
                  hintText: 'Full Name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  validator: (val) => val!.validateUserName(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        buttonText: 'Save Changes',
        onPressed: () {
          if (updateProfileFormKey.currentState!.validate()) {
            context.navigateTo(RoutesName.mainAppScreen, arguments: 4);
          }
        },
      ),
    );
  }
/*
    void _showPicker({
    required BuildContext context,
    required void Function() onTapGallery,
    required void Function() onTapCamera,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: MainContainer(
              color: ColorManager.scaffoldColor,
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text("gallery".tr()),
                      onTap: onTapGallery),
                  new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text("camera".tr()),
                      onTap: onTapCamera),
                ],
              ),
            ),
          );
        });
  }
   */
}
