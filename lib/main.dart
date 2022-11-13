import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_app/screen/home_screen.dart';
import 'package:test_api_app/services/article_repository.dart';

import 'bloc/article_bloc.dart';
import 'data/const/const.dart';

void main() {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Manager(),
    );
  }
}

class Manager extends StatefulWidget {
  const Manager({Key? key}) : super(key: key);

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  final articleRepository = ArticleRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
        create: (context) => ArticleBloc(articleRepository: articleRepository),
        child: const Scaffold(
            backgroundColor: black_86,
            body: HomeScreen()));
  }
}
