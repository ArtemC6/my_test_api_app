import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/article_bloc.dart';
import '../../bloc/article_event.dart';

const black_93 = Color(0xFF161616);
const black_86 = Color(0xFF222327);

class FadeRouteAnimation extends PageRouteBuilder {
  final Widget page;

  FadeRouteAnimation(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        );
}

const List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.favorite_rounded,
];

const List<String> listCategory = [
  'Home',
  'Arts',
  'Science',
  'World',
  'Us',
];

void getStateArticle(int index, BuildContext context) {
  if (index == 0) {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadHomeEvent());
  } else if (index == 1) {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadArtsEvent());
  } else if (index == 2) {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadScienceEvent());
  } else if (index == 3) {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadWorldEvent());
  } else if (index == 4) {
    BlocProvider.of<ArticleBloc>(context).add(ArticleLoadUsEvent());
  }
}

Future<void> openUrl(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {}
}
