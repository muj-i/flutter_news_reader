import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news_reader/app.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ArticlesDataAdapter());

  await Hive.initFlutter();

  runApp(const ProviderScope(child: FlutterNewsReaderApp()));
}

class ArticlesDataAdapter extends TypeAdapter<ArticlesData> {
  @override
  final typeId = 0;

  @override
  ArticlesData read(BinaryReader reader) {
    final Map<String, dynamic> json = jsonDecode(reader.read());
    return ArticlesData.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, ArticlesData obj) {
    final jsonStr = jsonEncode(obj.toJson());
    writer.write(jsonStr);
  }
}
