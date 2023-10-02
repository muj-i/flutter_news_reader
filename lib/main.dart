import 'package:flutter/material.dart';
import 'package:flutter_news_reader/app.dart';
import 'package:flutter_news_reader/data/utils/hive_data_adapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ArticlesDataAdapter());

  await Hive.initFlutter();

  runApp(const ProviderScope(child: FlutterNewsReaderApp()));
}
