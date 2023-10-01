import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_appbar_tabbar_screen.dart';
import 'package:flutter_news_reader/presentation/ui/screens/online_screens/appbar_tabbar_screen.dart';
class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}
class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex = 1;
  final List<Widget> _screens = const [
    AppBarTabBArScreen(),
    OfflineAppBarTabBArScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        _selectedScreenIndex = 0; 
      });
    }
  }

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
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBroken.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBroken.document,
            ),
            label: 'Offline',
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_appbar_tabbar_screen.dart';
// import 'package:flutter_news_reader/presentation/ui/screens/online_screens/appbar_tabbar_screen.dart';
// import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_allnews_screen.dart';
// import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_allnews_screen.dart';

// class BottomNavBaseScreen extends StatefulWidget {
//   const BottomNavBaseScreen({super.key});

//   @override
//   State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
// }

// class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
//   int _selectedScreenIndex = 1;
//   final List<Widget> _screens = const [
//     AppBarTabBArScreen(),
//     OfflineAppBarTabBArScreen()
   
   
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedScreenIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedScreenIndex,
//         unselectedItemColor: Colors.grey,
//         unselectedLabelStyle: const TextStyle(color: Colors.grey),
//         showUnselectedLabels: true,
//         onTap: (int index) {
//           _selectedScreenIndex = index;

//           if (mounted) {
//             setState(() {});
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 IconlyBroken.home,
//               ),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 IconlyBroken.document,
//               ),
//               label: 'Offline'),
//         ],
//       ),
//     );
//   }
// }
