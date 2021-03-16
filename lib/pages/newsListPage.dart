import 'package:flutter/material.dart';
import 'package:News/pages/newsArticleDetailsPage.dart';
import 'package:News/viewmodels/newsArticleListViewModel.dart';
import 'package:News/viewmodels/newsArticleViewModel.dart';
import 'package:News/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("No results found!"));
      case LoadingStatus.completed:
        return Expanded(
            child: NewsList(
          articles: vm.articles,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Assignment", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              // fetch all the news related to the keyword
              if (value.isNotEmpty) {
                vm.search(value);
              }
            },
            decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Icon(Icons.search, color: Colors.red),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,

                    
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                )),
          ),
          SizedBox(
            height: 10,
          ),
          _buildList(context, vm)
        ]));
  }
}
