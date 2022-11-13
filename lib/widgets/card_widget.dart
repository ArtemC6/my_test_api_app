import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/const/const.dart';
import '../models/article_model.dart';
import '../screen/article_screen.dart';

InkWell cardArticle(
    BuildContext context, List<Article> listArticle, int index, Size size) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      Navigator.push(
          context,
          FadeRouteAnimation(ArticleScreen(
            article: listArticle,
            index: index,
          )));
    },
    child: Card(
      shadowColor: Colors.white38,
      color: black_86,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            width: 0.8,
            color: Colors.white24,
          )),
      elevation: 8,
      child: Container(
        decoration: const BoxDecoration(
            color: black_86,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 0.8,
                            value: progress.progress,
                          ),
                        ),
                      ),
                  imageUrl: listArticle[index].imageUrl,
                  fit: BoxFit.cover,
                  height: size.height * .28,
                  width: MediaQuery.of(context).size.width),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 4, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: listArticle[index].title,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 12.5,
                            color: Colors.white,
                            letterSpacing: .9),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 8,
                          child: RichText(
                            text: TextSpan(
                              text: listArticle[index].byline,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 11.5,
                                    color: Colors.white70,
                                    letterSpacing: .7),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: RichText(
                            text: TextSpan(
                              text: listArticle[index]
                                  .publishedDate
                                  .substring(0, 10),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueAccent,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
