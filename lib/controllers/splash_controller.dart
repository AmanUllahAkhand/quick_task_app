import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Wait 3 seconds then go to Home
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
