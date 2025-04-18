import 'package:car_ads_app/core/config/localization/locale_keys.g.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/extensions/validate_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CountryAndPhoneSection extends StatelessWidget {
  final TextEditingController phoneController;
  void Function(PhoneNumber?)? onSaved;

  CountryAndPhoneSection(
      {required this.phoneController, super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return IntlPhoneField(
        controller: phoneController,
        validator: (val) => val!.completeNumber.validatePhoneNumber(),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          hintText: LocaleKeys.phoneNumber.tr(),
          fillColor: theme.fillColor,
          border: theme.border,
          errorBorder: theme.errorBorder,
        ),
        dropdownTextStyle: context.bodyMedium,
        style: context.bodyMedium,
        initialCountryCode: 'PS',
        languageCode: context.locale.languageCode,
        dropdownIconPosition: context.locale.languageCode == 'en'
            ? IconPosition.leading
            : IconPosition.trailing,
        onSaved: onSaved);
  }
}
