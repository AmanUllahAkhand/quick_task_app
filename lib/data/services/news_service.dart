import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String apiKey = "1c92c0cc3285425fb8ee9c239548f7fc";
  static const String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey";

  Future<List<dynamic>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["articles"];
    } else {
      throw Exception("Failed to load news");
    }
  }
}
