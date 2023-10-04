import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/widgets/icon_with_collapsing_text.dart';
import 'package:flutter_news_reader/view/screens/online_screens/allnews_screen.dart';
import 'package:flutter_news_reader/view/screens/online_screens/breakingnews_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          actions:  [
            IconWithCollapsingText(
              iconData: FontAwesomeIcons.earthAsia,
              text: 'Online',
              alternativeIconData: FontAwesomeIcons.earthAsia,
              containerColor: Colors.green.withOpacity(.2),
              
            )
          ],
          centerTitle: false,
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
