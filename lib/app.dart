import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/presentation/ui/screens/offline_screens/offline_appbar_tabbar_screen.dart';
import 'package:flutter_news_reader/presentation/ui/screens/online_screens/appbar_tabbar_screen.dart';

class FlutterNewsReaderApp extends StatefulWidget {
  const FlutterNewsReaderApp({super.key});

  @override
  State<FlutterNewsReaderApp> createState() => _FlutterNewsReaderAppState();
}

class _FlutterNewsReaderAppState extends State<FlutterNewsReaderApp> {
  Future<bool> _checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkInternetConnectivity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          final bool isInternetAvailable = snapshot.data ?? false;
          final homeScreen = isInternetAvailable
              ? const AppBarTabBArScreen()
              : const OfflineAppBarTabBArScreen();
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              useMaterial3: true,
            ),
            home: homeScreen,
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }
}
