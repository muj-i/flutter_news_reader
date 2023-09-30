import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/network_response.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/services/network_caller.dart';
import 'package:flutter_news_reader/data/utils/utls.dart';
import 'package:flutter_news_reader/presentation/ui/widgets/news_list_tile.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  NewsArticleModel newsArticleModel = NewsArticleModel();
  late List<ArticlesData> newsArticleList = [];
  int p = 1;
  Future<void> getNews() async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.allNewsApiUrl(p.toString()));
    if (response.isSuccess) {
      newsArticleModel = NewsArticleModel.fromJson(response.body ?? {});
      newsArticleList = newsArticleModel.articles!;
      log(newsArticleList.length.toString());
    } else {
      log('x');
    }
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: newsArticleList.length,
            itemBuilder: (context, index) {
              return NewsListTile(
                articlesData: newsArticleList[index],
                // title: Text(newsArticleList[index].title.toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
