import 'dart:async';
import 'package:car_ads_app/core/commonWidgets/custom_button.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              // SearchAnchor(builder: (context,s){return Text('Ahed');}, suggestionsBuilder: (context,s){return [
              //   Text('data'),
              //   Text('data2'),
              //   Text('data3'),
              // ];}),
              // SearchAnchor.bar(suggestionsBuilder: (context,s){return [];}),
              Consumer(builder: (context, WidgetRef ref, child) {
                final count = ref.watch(counterProvider);
                // watch the StateNotifierProvider to return a DateTime (the state)
                final currentTime = ref.watch(clockProvider);
                // format the time as `hh:mm:ss`
                final timeFormatted = DateFormat.Hms().format(currentTime);
                return Column(
                  children: [
                    Text(
                      timeFormatted,
                      style: context.titleMedium,
                    ),
                    20.addVerticalSpace,
                    Text(
                      count.toString(),
                      style: context.titleMedium,
                    ),
                    20.addVerticalSpace,
                    CustomButtonWidget(
                        title: '+',
                        onPressed: () =>
                            ref.read(counterProvider.notifier).increment())
                  ],
                );
              }),
              Text(
                'Welcome in Add page${SharedPrefController.getUserData().phone}',
                style: context.titleMedium,
              ),
              16.addVerticalSpace,
              CustomButtonWidget(
                  title: 'LogOut Now',
                  onPressed: () async {
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

class TestRiverpod extends StateNotifier<int> {
  TestRiverpod() : super(0);

  int increment() => state++;
}

final counterProvider = StateNotifierProvider<TestRiverpod, int>((ref) {
  // ref.keepAlive();
  return TestRiverpod();
});

// In this case the widget stay listen the change in provider and show this change in Screen

class Clock extends StateNotifier<DateTime> {
  // 1. initialize with current time
  Clock() : super(DateTime.now()) {
    // 2. create a timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // 3. update the state with the current time
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
