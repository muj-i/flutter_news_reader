import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/data/utils/local_data_storage.dart';
import 'package:flutter_news_reader/presentation/ui/widgets/news_list_tile.dart';

class OfflineBreakingNewsScreen extends StatelessWidget {
  const OfflineBreakingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesData>>(
      future: LocalDataStorage.getArticlesFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          final articlesDataList = snapshot.data;

          return ListView.builder(
            itemCount: articlesDataList?.length,
            itemBuilder: (context, index) {
              return NewsListTile(
                articlesData: articlesDataList![index],
              );
            },
          );
        }
      },
    );
  }
}
