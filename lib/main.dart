import 'package:flutter/material.dart';
import 'package:flutter_news_reader/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  //await Hive.initFlutter();

//var box = await Hive.openBox('newsBox');

  runApp(const ProviderScope(child: FlutterNewsReaderApp()));
}
