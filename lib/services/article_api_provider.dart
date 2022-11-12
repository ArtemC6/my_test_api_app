import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ArticleProvider {
  Future<List<Article>> getArticle(String select) async {
    const String key = 'j41uNeHmlbA5Rgv9BOGyNCc3lxGbnY8v';

    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/$select.json?api-key=$key'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = [];

      data['results'].forEach(
        (articleMap) => articles.add(Article.fromJson(articleMap)),
      );

      return articles;
    } else {
      throw Exception('Error');
    }
  }
}
