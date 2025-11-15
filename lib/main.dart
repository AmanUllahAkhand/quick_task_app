import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'bindings/splash_binding.dart';
import 'bindings/home_binding.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const QuickTaskApp());
}

class QuickTaskApp extends StatelessWidget {
  const QuickTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuickTask App',
      debugShowCheckedModeBanner: false,
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
      ],
    );
  }
}
