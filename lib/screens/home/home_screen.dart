import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../tasks/tasks_screen.dart';
import '../news/news_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends GetView<HomeController> {
  final List<Widget> pages = [
    TasksScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages[controller.currentIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeTab(index),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
