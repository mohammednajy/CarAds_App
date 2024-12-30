import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/features/profile/domain/provider/profile_provider.dart';
import 'package:car_ads_app/features/profile/presentation/widgets/custom_floating_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeLanguageScreen extends ConsumerWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedLang = ref.watch(selectedLanguageProvider);
    final langNotifier = ref.read(selectedLanguageProvider.notifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Language '),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.paddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your comfortable language!',
              style: context.bodyMedium,
            ),
            16.addVerticalSpace,
            RadioListTile<String>(
              title: const Text('English'),
              value: 'en',
              groupValue: selectedLang,
              onChanged: (value) {
                langNotifier.state = value!;
              },
            ),
            const Divider(color: ColorManager.dividerColor),
            RadioListTile<String>(
              title: const Text('Arabic'),
              value: 'ar',
              groupValue: selectedLang,
              onChanged: (value) {
                langNotifier.state = value!;
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        buttonText: 'Save Changes',
        onPressed: () {
            context.setLocale(Locale(selectedLang));
        },
      ),
    );
  }
}
