import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/news_controller.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Feed")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.fetchNews,
          child: ListView.builder(
            itemCount: controller.newsList.length,
            itemBuilder: (context, index) {
              final article = controller.newsList[index];

              return GestureDetector(
                onTap: () {
                  Get.to(() => NewsDetailsScreen(article: article));
                },
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: article.urlToImage.isNotEmpty
                        ? Image.network(
                      article.urlToImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                        : SvgPicture.asset(
                      'assets/images/default-news.svg',
                      width: 80,
                      height: 80,
                    ),
                    title: Text(article.title,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(article.description,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 6),
                        Text(
                          article.source,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
