import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeManager extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.light;

  void toggleTheme() {
    state = (state == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeManagerProvider =
    NotifierProvider<ThemeManager, ThemeMode>(() => ThemeManager());
