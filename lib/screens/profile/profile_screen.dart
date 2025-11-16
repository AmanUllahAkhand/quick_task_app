import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Obx(() {
          return SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeController.isDarkMode.value,
            onChanged: (value) => themeController.toggleTheme(),
          );
        }),
      ),
    );
  }
}
