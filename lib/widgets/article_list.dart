import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test_api_app/bloc/article_state.dart';

import '../bloc/article_bloc.dart';
import '../bloc/article_event.dart';
import 'card_widget.dart';
import 'component_widget.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleList();
}

class _ArticleList extends State<ArticleList> {
  @override
  void initState() {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          return Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 24),
            child: AnimationLimiter(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 60, top: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: state.loadedArticle.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 350),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 2200),
                          verticalOffset: 140,
                          curve: Curves.ease,
                          child: FadeInAnimation(
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 2500),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: cardArticle(context, state, index, size),
                            ),
                          ),
                        ),
                      );
                    })),
          );
        }
        if (state is ArticleEmptyState) {
          return const Center(
            child: Text('Error fetching user'),
          );
        }
        return Container();
      },
    );
  }
}
