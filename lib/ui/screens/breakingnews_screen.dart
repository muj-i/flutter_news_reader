import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/network_response.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/services/network_caller.dart';
import 'package:flutter_news_reader/data/utils/utls.dart';
import 'package:flutter_news_reader/ui/widgets/news_list_tile.dart';
import 'package:flutter_news_reader/ui/widgets/custom_snackbar.dart';
import 'package:flutter_news_reader/ui/widgets/shimmer_list_item.dart';

class BreakingNewsScreen extends StatefulWidget {
  const BreakingNewsScreen({super.key});

  @override
  State<BreakingNewsScreen> createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  NewsArticleModel newsArticleModel = NewsArticleModel();
  late List<ArticlesData> newsArticleList = [];
  bool _getNewsInProgress = false;

  int p = 1;

  Future<void> getBreakingNews() async {
    _getNewsInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.breakingNewsUrl(p.toString()));

    _getNewsInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      newsArticleModel = NewsArticleModel.fromJson(response.body ?? {});
      newsArticleList = newsArticleModel.articles!;
      log(newsArticleList.length.toString());
    } else {
      if (mounted) {
        CustomSnackbar.show(
            context: context, message: 'News data fetch failed');
      }
      log('News data fetch failed');
    }
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBreakingNews();
    });

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
          child: _getNewsInProgress
              ? SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: ListView.builder(
                    itemCount: 5, // Number of shimmer items
                    itemBuilder: (context, index) {
                      return const ShimmerListItem();
                    },
                  ),
                )
              : ListView.builder(
                  itemCount: newsArticleList.length,
                  itemBuilder: (context, index) {
                    return NewsListTile(
                      articlesData: newsArticleList[index],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
