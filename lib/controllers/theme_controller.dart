import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = "isDarkMode";

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    isDarkMode.value = _loadTheme();
    super.onInit();
  }

  bool _loadTheme() => _box.read(_key) ?? false;

  _saveTheme(bool value) => _box.write(_key, value);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
    _saveTheme(isDarkMode.value);
  }
}
