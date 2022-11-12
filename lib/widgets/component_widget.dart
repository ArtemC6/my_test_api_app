import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/const/const.dart';

Padding searchPanel(TextEditingController textEditingController, onTap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
              height: 40.0,
              decoration: const BoxDecoration(
                  color: black_86,
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                    decoration: const InputDecoration(
                      fillColor: black_93,
                      hintText: 'Search...',
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 2.0, top: 2.0),
                      hintStyle: TextStyle(color: Colors.white70),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(width: 1, color: Colors.white70),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                    ),
                  ))),
        ),
        IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ))
      ],
    ),
  );
}

Padding loadingArticle(Size size) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardLoading(
          cardLoadingTheme: CardLoadingTheme(
              colorOne: Colors.white.withOpacity(.20), colorTwo: black_86),
          height: size.height * .26,
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
