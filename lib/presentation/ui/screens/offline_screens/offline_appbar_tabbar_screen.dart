import 'package:flutter/material.dart';
import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_allnews_screen.dart';
import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_breakingnews_screen.dart';

class OfflineAppBarTabBArScreen extends StatefulWidget {
  const OfflineAppBarTabBArScreen({Key? key}) : super(key: key);

  @override
  State<OfflineAppBarTabBArScreen> createState() =>
      _OfflineAppBarTabBArScreenState();
}

class _OfflineAppBarTabBArScreenState extends State<OfflineAppBarTabBArScreen> {
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
                text: "Cached Breaking News",
              ),
              Tab(
                text: 'Cached All News',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OfflineBreakingNewsScreen(),
            OfflineAllNewsScreen(),
          ],
        ),
      ),
    );
  }
}
