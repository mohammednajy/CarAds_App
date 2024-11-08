import 'package:flutter/material.dart';

// use this across
// context.bodySmall

extension TextStyleExtension on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
}

extension BuildContextExtensions on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
