import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/const/const.dart';
import '../models/article_model.dart';
import '../widgets/component_widget.dart';
import '../widgets/interesting_article.dart';

class ArticleScreen extends StatefulWidget {
  List<Article> article;
  int index;

  ArticleScreen({Key? key, required this.article, required this.index})
      : super(key: key);

  @override
  _ArticleArticleScreen createState() => _ArticleArticleScreen(article, index);
}

class _ArticleArticleScreen extends State<ArticleScreen> {
  List<Article> article;
  int index;
  _ArticleArticleScreen(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black_86,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AnimationLimiter(
            child: AnimationConfiguration.staggeredList(
              position: 1,
              delay: const Duration(milliseconds: 250),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2200),
                horizontalOffset: 250,
                curve: Curves.ease,
                child: FadeInAnimation(
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 2400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          imageArticle(size, context, article[index].imageUrl),
                          favoritesArticle(),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: article[index].title,
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            letterSpacing: .9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: article[index]
                                      .publishedDate
                                      .substring(0, 10),
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        letterSpacing: .9),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      textForm(article[index].summary, 14),
                      textFormUrl(article[index].url),
                      Align(
                          alignment: Alignment.centerRight,
                          child: textForm(article[index].byline, 11.5)),
                      interestingArticle(article),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
