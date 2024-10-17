import 'package:car_ads_app/core/localization/codegen_loader.g.dart';
import 'package:car_ads_app/core/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/theme/dark_theme.dart';
import 'package:car_ads_app/core/theme/light_theme.dart';
import 'package:car_ads_app/core/theme/theme_provider.dart';
import 'package:car_ads_app/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(themeManagerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      themeMode: themeManager,
      theme: lightTheme,
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.hello.tr()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LocaleKeys.name.tr()),
          ElevatedButton(
              onPressed: () {
                context.locale.languageCode == 'ar'
                    ? context.setLocale(Locale('en'))
                    : context.setLocale(Locale('ar'));
              },
              child: Text(LocaleKeys.change_lang.tr())),
          ElevatedButton(
              onPressed: () {
                ref.read(themeManagerProvider.notifier).toggleTheme();
              },
              child: Text(LocaleKeys.theme.tr()))
        ],
      ),
    );
  }
}
