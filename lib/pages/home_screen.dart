import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_app/widgets/component_widget.dart';

import '../bloc/article_bloc.dart';
import '../data/const/const.dart';
import '../services/article_repository.dart';
import '../widgets/article_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final articleRepository = ArticleRepository();
  int currentIndex = 0;
  TextEditingController textEditingController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget home() {
      return SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            _tabController.addListener(() {
              getStateArticle(_tabController.index, context);
            });
            return <Widget>[
              SliverAppBar(
                expandedHeight: 134,
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
                      child: tabPanel(_tabController),
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
                  controller: _tabController,
                  children: const [
                    ArticleList(),
                    ArticleList(),
                    ArticleList(),
                    ArticleList(),
                    ArticleList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget childEmployee() {
      var child;
      switch (currentIndex) {
        case 0:
          child = home();
          break;
        case 1:
          child = home();
          break;
      }
      return child;
    }

    return BlocProvider<ArticleBloc>(
        create: (context) => ArticleBloc(articleRepository: articleRepository),
        child: Scaffold(
            backgroundColor: black_86,
            bottomNavigationBar: SizedBox(
              height: size.width * .130,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.width * .28),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: size.width * .014),
                      Icon(listOfIcons[index],
                          size: size.width * .076, color: Colors.white),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          top: index == currentIndex ? 0 : size.width * .029,
                          right: size.width * .0422,
                          left: size.width * .0422,
                        ),
                        width: size.width * .153,
                        height: index == currentIndex ? size.width * .014 : 0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SizedBox.expand(child: childEmployee())));
  }
}
