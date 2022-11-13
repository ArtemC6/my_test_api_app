import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/article_bloc.dart';
import '../bloc/article_state.dart';
import '../models/article_model.dart';
import 'component_widget.dart';

BlocBuilder<ArticleBloc, ArticleState> listViewArticle(
    Size size,
    Future<void> Function(String text, List<Article> list) searchArticle,
    TextEditingController textEditingController,
    List<Article> listSearchArticle) {
  return BlocBuilder<ArticleBloc, ArticleState>(
    builder: (context, state) {
      if (state is ArticleEmptyState) {
        return const Center(
          child: Text('No data'),
        );
      }
      if (state is ArticleLoadingState) {
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return loadingArticle(size);
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        );
      }
      if (state is ArticleLoadedState) {
        searchArticle(textEditingController.text, state.loadedArticle);
        return listArticle(context, listSearchArticle, size);
      }
      if (state is ArticleEmptyState) {
        return const Center(
          child: Text('Error'),
        );
      }
      return Container();
    },
  );
}
