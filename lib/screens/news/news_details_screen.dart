import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.source)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.urlToImage.isNotEmpty ? article.urlToImage : '',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: SvgPicture.asset(
                    'assets/images/default-news.svg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article.title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Source: ${article.source}",
                style: const TextStyle(color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
