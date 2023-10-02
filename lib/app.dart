import 'package:flutter/material.dart';
import 'package:flutter_news_reader/presentation/ui/screens/bottom_nav_base_page.dart';

class FlutterNewsReaderApp extends StatelessWidget {
  const FlutterNewsReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const BottomNavBaseScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
