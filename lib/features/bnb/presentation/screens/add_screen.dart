import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome in Add page${SharedPrefController.getUserData().phone}',
                style: context.titleMedium,
              ),
              16.addVerticalSpace,
              CustomButtonWidget(title: 'LogOut Now', onPressed: ()async{
                await FirebaseAuth.instance.signOut();
                // await FacebookAuth.instance.logOut();
                SharedPrefController.removeUser();
                context.navigateAndReplace(RoutesName.signInScreen);
              })
            ],
          ),
        ),
      ),
    );
  }
}
