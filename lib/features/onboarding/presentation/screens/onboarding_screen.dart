import 'package:car_ads_app/core/commonWidgets/bottom_sheet_widget.dart';
import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/commonWidgets/custom_textFeild.dart';
import 'package:car_ads_app/core/commonWidgets/main_container.dart';
import 'package:car_ads_app/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.hello.tr(),
      ),
      body: Center(
          child: MainCard(
        left: 20,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                hintText: LocaleKeys.ahed.tr(),
                // obscureText: true,
              ),
              const SizedBox(height: 30),
              CustomButtonWidget(
                title: 'Send Request',
                onPressed: () async {
                  showModalBottomSheet(
                      useSafeArea: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      context: context,
                      builder: (context) => BottomSheetWidget(
                            address: 'clearYourHistory',
                            bodyText:
                                'Are you sure you want to clear your history?\nThis action cannot be undone, so proceed with caution.',
                            buttonText: 'YES , CLEAR IT ',
                            secondButtonText: 'NO , I CHANGED MY MIND !',
                            onPressedButton: () {},
                            onPressedTextButton: () {},
                          ));

                  // try {
                  //   final credential = await FirebaseAuth.instance
                  //       .createUserWithEmailAndPassword(
                  //     email: 'ahed@gmail.com',
                  //     password: 'password',
                  //   );
                  //   print(credential.user);
                  // } on FirebaseAuthException catch (e) {
                  //   if (e.code == 'weak-password') {
                  //     print('The password provided is too weak.');
                  //   } else if (e.code == 'email-already-in-use') {
                  //     print('The account already exists for that email.');
                  //   }
                  // } catch (e) {
                  //   print(e);
                  // }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
