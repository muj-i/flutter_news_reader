import 'package:flutter/material.dart';

class OfflineNewsScreen extends StatefulWidget {
  const OfflineNewsScreen({super.key});

  @override
  State<OfflineNewsScreen> createState() => _OfflineNewsScreenState();
}

class _OfflineNewsScreenState extends State<OfflineNewsScreen> {
  @override
  Widget build(BuildContext context) {
    //final ArticlesData articlesData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Flutter News Reader'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Offline News'),
          );
        },
      ),
    );
  }
}
