import '../models/news_model.dart';
import '../services/news_service.dart';

class NewsRepository {
  final NewsService _service = NewsService();

  Future<List<NewsArticle>> getNews() async {
    final data = await _service.fetchNews();
    return data.map((json) => NewsArticle.fromJson(json)).toList();
  }
}
