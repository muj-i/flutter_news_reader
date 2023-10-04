import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/screens/offline_screens/offline_allnews_screen.dart';
import 'package:flutter_news_reader/view/screens/offline_screens/offline_breakingnews_screen.dart';
import 'package:flutter_news_reader/view/widgets/icon_with_collapsing_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              iconData: FontAwesomeIcons.earthAsia,
              text: 'Offline',
              alternativeIconData: FontAwesomeIcons.globe,
              containerColor: Colors.red.withOpacity(.3),
            )
          ],
          centerTitle: false,
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
