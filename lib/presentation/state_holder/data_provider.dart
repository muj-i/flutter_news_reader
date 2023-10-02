import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/services/api_services.dart';
import 'package:flutter_news_reader/data/utils/utls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breakingnewsDataProvider =
    FutureProvider<List<ArticlesData>>((ref) async {
  return ref
      .watch(apiServiceProvider)
      .getBreakingNews(Urls.breakingNewsUrl, 'breaking');
});
final allnewsDataProvider = FutureProvider<List<ArticlesData>>((ref) async {
  return ref
      .watch(apiServiceProvider)
      .getBreakingNews(Urls.allNewsApiUrl, 'all');
});
