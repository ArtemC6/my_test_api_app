import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_app/bloc/article_event.dart';
import 'package:test_api_app/bloc/article_state.dart';

import '../models/article_model.dart';
import '../services/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late final ArticleRepository articleRepository;

  ArticleBloc({required this.articleRepository}) : super(ArticleEmptyState()) {
    on<ArticleLoadHomeEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final List<Article> loadedArticleList =
              await articleRepository.getAllArticles('home');
          emit(ArticleLoadedState(loadedArticle: loadedArticleList));
        } catch (_) {
          emit(ArticleErrorState() as ArticleState);
        }
      },
    );

    on<ArticleLoadArtsEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final List<Article> loadedArticleList =
              await articleRepository.getAllArticles('arts');
          emit(ArticleLoadedState(loadedArticle: loadedArticleList));
        } catch (_) {
          emit(ArticleErrorState() as ArticleState);
        }
      },
    );

    on<ArticleLoadScienceEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final List<Article> loadedArticleList =
              await articleRepository.getAllArticles('science');
          emit(ArticleLoadedState(loadedArticle: loadedArticleList));
        } catch (_) {
          emit(ArticleErrorState() as ArticleState);
        }
      },
    );

    on<ArticleLoadWorldEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final List<Article> loadedArticleList =
              await articleRepository.getAllArticles('world');
          emit(ArticleLoadedState(loadedArticle: loadedArticleList));
        } catch (_) {
          emit(ArticleErrorState() as ArticleState);
        }
      },
    );

    on<ArticleLoadUsEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final List<Article> loadedArticleList =
              await articleRepository.getAllArticles('us');
          emit(ArticleLoadedState(loadedArticle: loadedArticleList));
        } catch (_) {
          emit(ArticleErrorState() as ArticleState);
        }
      },
    );
  }
}
