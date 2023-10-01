import 'dart:developer';

import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataStorage {
  LocalDataStorage._();

  static Box<ArticlesData>? _dataBox;

  static Future<void> init() async {
    if (_dataBox == null) {
      await Hive.openBox<ArticlesData>('articlesDataBox');
      _dataBox = await Hive.openBox<ArticlesData>('articlesDataBox');
    }
  }

  static Future<void> saveArticlesData(List<ArticlesData> articlesData) async {
    await init();
    await _dataBox?.clear();
    await _dataBox?.addAll(articlesData);
    log(articlesData.length.toString()); 
    log(articlesData.toString()); 
  }

  static Future<List<ArticlesData>> getArticlesFromDatabase() async {
  final box = await Hive.openBox<ArticlesData>('articlesDataBox');
  return box.values.toList();
}

  static Future<void> clearArticlesData() async {
    await _dataBox?.clear();
  }
}

class AllNewsLocalDataStorage {
  AllNewsLocalDataStorage._();

  static Box<ArticlesData>? _allNewsDataBox;

  static Future<void> init() async {
    if (_allNewsDataBox == null) {
      await Hive.openBox<ArticlesData>('allNewsArticlesDataBox');
      _allNewsDataBox = await Hive.openBox<ArticlesData>('allNewsArticlesDataBox');
    }
  }

  static Future<void> saveArticlesData(List<ArticlesData> articlesData) async {
    await init();
    await _allNewsDataBox?.clear();
    await _allNewsDataBox?.addAll(articlesData);
    log(articlesData.length.toString()); 
    log(articlesData.toString()); 
  }

  static Future<List<ArticlesData>> getArticlesFromDatabase() async {
  final box = await Hive.openBox<ArticlesData>('allNewsArticlesDataBox');
  return box.values.toList();
}

  // static Future<void> clearArticlesData() async {
  //   await _allNewsDataBox?.clear();
  // }
}
