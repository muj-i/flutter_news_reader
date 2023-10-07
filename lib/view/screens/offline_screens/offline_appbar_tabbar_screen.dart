import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/screens/offline_screens/offline_allnews_screen.dart';
import 'package:flutter_news_reader/view/screens/offline_screens/offline_breakingnews_screen.dart';
import 'package:flutter_news_reader/view/widgets/icon_with_collapsing_text.dart';

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
          actions: [
            IconWithCollapsingText(
              iconData: Icons.signal_cellular_off_rounded,
              text: 'Offline',
              alternativeIconData: Icons.signal_cellular_off_rounded,
              containerColor: Colors.red.withOpacity(.3),
            )
          ],
          centerTitle: false,
          title: const Text('News Reader'),
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
