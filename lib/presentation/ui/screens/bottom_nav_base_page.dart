import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_news_reader/presentation/ui/screens/appbar_tabbar_screen.dart';
import 'package:flutter_news_reader/presentation/ui/screens/nnn.dart';
import 'package:flutter_news_reader/presentation/ui/screens/offline_news_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex = 1;
  final List<Widget> _screens = const [
    AppBarTabBArScreen(),
YourWidget()
    //OfflineNewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        onTap: (int index) {
          _selectedScreenIndex = index;

          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBroken.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBroken.document,
              ),
              label: 'Offline'),
        ],
      ),
    );
  }
}
