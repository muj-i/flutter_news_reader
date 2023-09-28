import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/network_response.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/services/network_caller.dart';
import 'package:flutter_news_reader/data/utils/utls.dart';
import 'package:flutter_news_reader/ui/widgets/custom_snackbar.dart';
import 'package:flutter_news_reader/ui/widgets/news_list_tile.dart';

class BreakingNewsScreen extends StatefulWidget {
  const BreakingNewsScreen({super.key});

  @override
  State<BreakingNewsScreen> createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  NewsArticleModel newsArticleModel = NewsArticleModel();
  late List<ArticlesData> newsArticleList = [];
  bool _getNewsInProgress = false;

  final _scrollController = ScrollController();
  int page = 20;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
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
          child: ListView.builder(
            controller: _scrollController,
            itemCount: /*_getNewsInProgress
                 ? newsArticleList.length + 1
                : */
                newsArticleList.length,
            itemBuilder: (context, index) {
              // if (index < newsArticleList.length) {
              return NewsListTile(
                articlesData: newsArticleList[index],
              );
              // } else {
              //   SizedBox(
              //     width: 200.0,
              //     height: 100.0,
              //     child: ListView.builder(
              //       itemCount: 1, // Number of shimmer items
              //       itemBuilder: (context, index) {
              //         return const ShimmerListItem();
              //       },
              //     ),
              //   );
              // }
              // return null;
            },
          ),
        ),
      ),
    );
  }

  Future<void> getBreakingNews() async {
    _getNewsInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final url = Urls.breakingNewsUrl(page.toString());
    final NetworkResponse response = await NetworkCaller().getRequest(url);
    log(url);
    _getNewsInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      newsArticleModel = NewsArticleModel.fromJson(response.body ?? {});
      newsArticleList = newsArticleModel.articles! /*  + newsArticleList */;
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

  void _scrollListener() {
    if (_getNewsInProgress) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      log('Call Api, Scroll count listener');

      page = page + 20;
      getBreakingNews();
    } else {
      log('Don\'t call Api');
    }
    //log('Scroll count listener');
  }
}
