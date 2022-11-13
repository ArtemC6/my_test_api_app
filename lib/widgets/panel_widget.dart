import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_app/bloc/article_bloc.dart';
import 'package:test_api_app/bloc/article_state.dart';

import '../data/const/const.dart';
import 'component_widget.dart';

Container searchPanel(TextEditingController textEditingController, onTap) {
  return Container(
      padding: const EdgeInsets.all(12),
      height: 64,
      decoration: const BoxDecoration(
          color: black_86, borderRadius: BorderRadius.all(Radius.circular(22))),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(
            controller: textEditingController,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            decoration: const InputDecoration(
              fillColor: black_93,
              hintText: 'Search...',
              contentPadding:
                  EdgeInsets.only(left: 14.0, bottom: 2.0, top: 2.0),
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                borderSide: BorderSide(width: 1, color: Colors.white),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
            ),
          )));
}

Widget homeTopPanel(
    TabController tabController,
    TextEditingController textEditingController,
    BlocBuilder<ArticleBloc, ArticleState> Function(Size size) listArticleMain,
    Size size) {

  return SafeArea(
    child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        tabController.addListener(() {
          getStateArticle(tabController.index, context);
        });
        return <Widget>[
          SliverAppBar(
            expandedHeight: 114,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            backgroundColor: innerBoxIsScrolled ? black_86 : black_86,
            title: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
                background: Column(
              children: [
                searchPanel(textEditingController, () {}),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: tabPanel(tabController),
                ),
              ],
            )),
          ),
        ];
      },
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                listArticleMain(size),
                listArticleMain(size),
                listArticleMain(size),
                listArticleMain(size),
                listArticleMain(size),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
