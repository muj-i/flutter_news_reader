import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/utils/local_data.dart';

class YourWidget extends StatelessWidget {
  const YourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesData>>(
      future: LocalDataStorage.getArticlesFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Data is still loading, return a loading indicator or placeholder
          return const CircularProgressIndicator(); // Replace with your loading widget
        } else if (snapshot.hasError) {
          // Data loading failed, display an error message
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // No data available, display a message
          return const Text('No data available');
        } else {
          // Data has been loaded successfully, build the ListView.builder
          final articlesDataList = snapshot.data;

          return ListView.builder(
            itemCount: articlesDataList?.length,
            itemBuilder: (context, index) {
              final article = articlesDataList?[index];
              // Replace this with how you want to display each article
              return ListTile(
                title: Text(article?.title ?? ''),
                subtitle: Text(article?.description ?? ''),
                // Add more fields as needed
              );
            },
          );
        }
      },
    );
  }
}
