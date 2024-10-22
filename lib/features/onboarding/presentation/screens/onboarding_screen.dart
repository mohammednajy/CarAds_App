import 'package:car_ads_app/core/localization/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.hello.tr()),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('data'),
        onPressed: () async {
          try {
            final credential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: 'ahed@gmail.com',
              password: 'password',
            );
            print(credential.user);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }
        },
      )),
    );
  }
}
