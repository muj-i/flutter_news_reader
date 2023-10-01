import 'dart:convert';
import 'dart:developer';

import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/utils/local_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<ArticlesData>> getBreakingNews(String url) async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> newsArticleModel = jsonResponse['articles'];
      
      // Convert the JSON response into a list of ArticlesData
      final List<ArticlesData> articlesDataList = newsArticleModel.map((e) => ArticlesData.fromJson(e)).toList();
      
      // Save the list of ArticlesData
      LocalDataStorage.saveArticlesData(articlesDataList);

      log(response.statusCode.toString());
      //log(response.body);
      return articlesDataList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());