import 'dart:convert';
import 'dart:developer';

import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/utils/utls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class BreakingnewsProvider {
  Future<List<ArticlesData>> getBreakingNews() async {
    final url = Urls.breakingNewsUrl(2.toString());
    // final NetworkResponse response = await NetworkCaller().getRequest(url);
    log(url);
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List newsArticleModel = jsonDecode(response.body)['articles'];
      return newsArticleModel
          .map(((e) => ArticlesData.fromJson(e)))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final breakingnewsProvider =
    Provider<BreakingnewsProvider>((ref) => BreakingnewsProvider());
