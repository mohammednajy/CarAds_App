import 'dart:async';

import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/providers/auth_provider.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.listen(loginProvider, (pre, next) {
      next.when(
        data: (data) {
        Navigator.pop(context);
        print(data.toString());
      }, 
      error: (error, _) {
        Navigator.pop(context);
        print(error);
      }, 
      loading: () {
        loadingWithText(context);
      });
    });


    return Scaffold(
      appBar: AppBar(
        title: const Text('login screen'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: email,
            decoration: const InputDecoration(label: Text('email')),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: password,
            decoration: const InputDecoration(label: Text('password')),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              ref
                  .read(loginProvider.notifier)
                  .login(email: email.text, password: password.text);
            },
            child: Text('login'),
          ),
        ],
      ),
    );
  }
}

loadingWithText(BuildContext context, {String? text}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
            child: SizedBox(
              height: 100,
              width: 250,
              child: Dialog(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text ?? 'waiting ....',
                    ),
                    const CircularProgressIndicator.adaptive(),
                  ],
                ),
              ),
            ),
          ));
}
