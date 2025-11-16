import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/theme_controller.dart';
import 'routes/app_routes.dart';
import 'bindings/splash_binding.dart';
import 'bindings/home_binding.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // initialize GetStorage first

  // Inject Theme Controller
  final ThemeController themeController = Get.put(ThemeController());

  runApp(QuickTaskApp(themeController: themeController));
}

class QuickTaskApp extends StatelessWidget {
  final ThemeController themeController;

  const QuickTaskApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'QuickTask App',
        debugShowCheckedModeBanner: false,
        themeMode:
        themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: AppRoutes.splash,
        getPages: [
          GetPage(
            name: AppRoutes.splash,
            page: () => SplashScreen(),
            binding: SplashBinding(),
          ),
          GetPage(
            name: AppRoutes.home,
            page: () => HomeScreen(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: AppRoutes.profile,
            page: () => ProfileScreen(),
          ),
        ],
      );
    });
  }
}
