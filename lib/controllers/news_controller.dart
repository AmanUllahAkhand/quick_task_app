import 'package:get/get.dart';
import '../data/models/news_model.dart';
import '../data/repositories/news_repository.dart';

class NewsController extends GetxController {
  var newsList = <NewsArticle>[].obs;
  var isLoading = false.obs;

  final NewsRepository repo = NewsRepository();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;
      final articles = await repo.getNews();
      newsList.assignAll(articles);
    } catch (e) {
      print("News fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
