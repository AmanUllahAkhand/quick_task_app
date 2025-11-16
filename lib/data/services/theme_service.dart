import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _storage = GetStorage();
  final _key = "isDarkMode";

  bool _loadThemeFromBox() => _storage.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _storage.write(_key, isDarkMode);

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    bool newMode = !_loadThemeFromBox();
    _saveThemeToBox(newMode);
    Get.changeThemeMode(newMode ? ThemeMode.dark : ThemeMode.light);
  }
}
