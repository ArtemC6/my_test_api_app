import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_app/bloc/article_state.dart';

import '../bloc/article_bloc.dart';
import '../bloc/article_event.dart';
import '../models/article_model.dart';
import '../widgets/bloc_widget.dart';
import '../widgets/panel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  late TabController _tabController;
  List<Article> listSearchArticle = [];

  @override
  void initState() {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadHomeEvent());
    _tabController = TabController(length: 5, vsync: this);
    textEditingController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    searchArticle(String text, List<Article> list) async {
      listSearchArticle.clear();
      if (text.isEmpty) {
        setState(() {
          listSearchArticle.addAll(list);
        });
        return;
      }

      for (var userDetail in list) {
        if (userDetail.title.toUpperCase().contains(text.toUpperCase())) {
          setState(() {
            listSearchArticle.add(userDetail);
          });
        }
      }
    }

    BlocBuilder<ArticleBloc, ArticleState> listArticleMain(Size size) {
      return listViewArticle(
          size, searchArticle, textEditingController, listSearchArticle);
    }

    return homeTopPanel(
        _tabController, textEditingController, listArticleMain, size);
  }
}
