import '../models/article_model.dart';

abstract class ArticleState {}

class ArticleEmptyState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  List<Article> loadedArticle;

  ArticleLoadedState({required this.loadedArticle})
      : assert(loadedArticle != null);
}

class ArticleErrorState {}
