import 'package:flutter/material.dart';
import 'package:News/pages/newsListPage.dart';
import 'package:News/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News",
        home: ChangeNotifierProvider(
            builder: (_) => NewsArticleListViewModel(), child: NewsListPage()));
  }
}
