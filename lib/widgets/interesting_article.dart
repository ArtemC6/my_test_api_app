import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/const/const.dart';
import '../models/article_model.dart';
import '../screen/article_screen.dart';

class interestingArticle extends StatelessWidget {
  List<Article> listArticle = [];

  interestingArticle(this.listArticle, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AnimationLimiter(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 6, bottom: 10, top: 24, right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: listArticle.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2200),
                  horizontalOffset: 140,
                  curve: Curves.ease,
                  child: FadeInAnimation(
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 2500),
                    child: InkWell(
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
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        margin: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                              shadowColor: Colors.white30,
                              color: black_86,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                    width: 0.5,
                                    color: Colors.white24,
                                  )),
                              elevation: 14,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                    progressIndicatorBuilder: (context, url,
                                            progress) =>
                                        Center(
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
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height: 100),
                                // width: size.width),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: listArticle[index].title,
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          letterSpacing: .6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
