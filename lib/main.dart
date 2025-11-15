import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'bindings/splash_binding.dart';
import 'screens/splash/splash_screen.dart';

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
      initialBinding: SplashBinding(),
      getPages: [
        GetPage(
          name: AppRoutes.splash,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),

        // temporary Home route to avoid crash
        GetPage(
          name: AppRoutes.home,
          page: () => const PlaceholderScreen(),
        ),
      ],
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen Placeholder")),
    );
  }
}
