import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/const/const.dart';
import '../models/article_model.dart';
import 'card_widget.dart';

Padding loadingArticle(Size size) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardLoading(
          cardLoadingTheme: CardLoadingTheme(
              colorOne: Colors.white.withOpacity(.20), colorTwo: black_86),
          height: size.height * .22,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          width: size.width,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: CardLoading(
                cardLoadingTheme: CardLoadingTheme(
                    colorOne: Colors.white.withOpacity(.20),
                    colorTwo: black_86),
                height: 26,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: CardLoading(
                cardLoadingTheme: CardLoadingTheme(
                    colorOne: Colors.white.withOpacity(.20),
                    colorTwo: black_86),
                height: 30,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

TabBar tabPanel(TabController tabController) {
  return TabBar(
      isScrollable: true,
      indicatorColor: Colors.red,
      controller: tabController,
      indicator: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: Colors.white10,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.blueAccent,
      tabs: [
        tabItem('Home'),
        tabItem('Arts'),
        tabItem('Science'),
        tabItem('World'),
        tabItem('Us'),
      ]);
}

Tab tabItem(String title) {
  return Tab(
    height: 34,
    child: RichText(
      text: TextSpan(
        text: title,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 12, color: Colors.white, letterSpacing: .7),
        ),
      ),
    ),
  );
}

GestureDetector textFormUrl(String url) {
  return GestureDetector(
    onTap: () {
      openUrl(url);
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 0.8,
              color: Colors.white10,
            )),
        elevation: 4,
        color: Colors.white.withOpacity(0.10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 5,
                child: RichText(
                  text: TextSpan(
                    text: url,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: .9),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Source',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                        letterSpacing: .9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container textForm(String text, double textSize) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            width: 0.8,
            color: Colors.white10,
          )),
      elevation: 4,
      color: Colors.white.withOpacity(0.10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: RichText(
          text: TextSpan(
            text: text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: textSize,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: .9),
            ),
          ),
        ),
      ),
    ),
  );
}

Positioned favoritesArticle() {
  return Positioned(
    bottom: 20,
    right: 20,
    child: Container(
      margin: const EdgeInsets.only(left: 14),
      height: 42,
      width: 42,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.50),
          borderRadius: BorderRadius.circular(99)),
      child: const Icon(
        Icons.favorite_outline,
        color: Colors.blueAccent,
        size: 20,
      ),
    ),
  );
}

SizedBox imageArticle(Size size, BuildContext context, String imageUrl) {
  return SizedBox(
    height: size.height * .28,
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
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: size.height * .30,
        width: MediaQuery.of(context).size.width),
  );
}

Container listArticle(
    BuildContext context, List<Article> listArticle, Size size) {
  return Container(
    height: MediaQuery.of(context).size.height,
    margin: const EdgeInsets.only(top: 24),
    child: AnimationLimiter(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 60, top: 10),
            scrollDirection: Axis.vertical,
            itemCount: listArticle.length,
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
                      child: cardArticle(context, listArticle, index, size),
                    ),
                  ),
                ),
              );
            })),
  );
}
