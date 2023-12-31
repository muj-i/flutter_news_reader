import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/screens/splash_screen.dart';

class FlutterNewsReaderApp extends StatelessWidget {
  const FlutterNewsReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
