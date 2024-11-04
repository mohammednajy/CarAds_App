import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'carAdd.dart';
import 'core/config/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Shared Preferences Setup
 await SharedPrefController.init();

  //Firebase Configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: CarAdsApp()),
    ),
  );
}
