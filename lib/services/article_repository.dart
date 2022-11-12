import 'package:test_api_app/services/article_api_provider.dart';

import '../models/article_model.dart';

class ArticleRepository {
  final ArticleProvider articleProvider = ArticleProvider();

  Future<List<Article>> getAllArticles(String select) =>
      articleProvider.getArticle(select);
}
