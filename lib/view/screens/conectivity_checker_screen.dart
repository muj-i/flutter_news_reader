import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/view/screens/offline_screens/offline_appbar_tabbar_screen.dart';
import 'package:flutter_news_reader/view/screens/online_screens/appbar_tabbar_screen.dart';

class NetworkConnectivityChecker extends StatefulWidget {
  const NetworkConnectivityChecker({Key? key}) : super(key: key);

  @override
  NetworkConnectivityCheckerState createState() =>
      NetworkConnectivityCheckerState();
}

class NetworkConnectivityCheckerState
    extends State<NetworkConnectivityChecker> {
  late ConnectivityResult result;
  late StreamSubscription<ConnectivityResult> subscription;
  var isConnected = false;
  var hasError = false;

  Future<void> checkInternet() async {
    try {
      result = await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        isConnected = true;
        setState(() {});
      } else {
        isConnected = false;
      }
    } catch (error) {
      log('Error in checkInternet: $error');
      isConnected = false;
    }
    hasError = isConnected == false;
    setState(() {});
  }

  void startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    }, onError: (error) {
      log('Error in startStreaming: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    checkInternet();
    startStreaming();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: hasError
            ? const OfflineAppBarTabBArScreen()
            : const AppBarTabBArScreen());
  }
}
