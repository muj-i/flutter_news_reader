import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/screens/online_screens/allnews_screen.dart';
import 'package:flutter_news_reader/view/screens/online_screens/breakingnews_screen.dart';

class AppBarTabBArScreen extends StatefulWidget {
  const AppBarTabBArScreen({Key? key}) : super(key: key);

  @override
  State<AppBarTabBArScreen> createState() => _AppBarTabBArScreenState();
}

class _AppBarTabBArScreenState extends State<AppBarTabBArScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter News Reader'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Breaking News",
              ),
              Tab(
                text: 'All News',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const BreakingNewsScreen(),
            AllNewsScreen(),
          ],
        ),
      ),
    );
  }
}
