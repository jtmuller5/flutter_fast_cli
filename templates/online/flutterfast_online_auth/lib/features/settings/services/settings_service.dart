import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast_online_auth/app/services.dart';

@Singleton(order: 1)
class SettingsService {
  ValueNotifier<ThemeMode> themeMode = ValueNotifier(getThemeModeFromString(sharedPrefs.getString('theme_mode') ?? 'ThemeMode.system'));

  void setThemeMode(String val) {
    debugPrint('val: ' + val.toString());
    sharedPrefs.setString('theme_mode', val);
    themeMode.value = getThemeModeFromString(val);
  }

  static ThemeMode getThemeModeFromString(String val) {
    return ThemeMode.values.firstWhere((e) => e.toString() == val);
  }
}
