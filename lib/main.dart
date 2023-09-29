import 'package:flutter/material.dart';
import 'package:flutter_news_reader/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
 await Hive.initFlutter();

var box = await Hive.openBox('newsBox');

  runApp(const FlutterNewsReaderApp());
}
