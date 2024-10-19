import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
}
