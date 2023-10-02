import 'package:flutter/material.dart';
import 'package:flutter_news_reader/state_holder/data_provider.dart';
import 'package:flutter_news_reader/view/widgets/news_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllNewsScreen extends ConsumerWidget {
  AllNewsScreen({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, ref) {
    final newsData = ref.watch(allnewsDataProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(breakingnewsDataProvider).when(
                data: (_) {},
                error: (err, s) {
                  // need to handle error if needed
                },
                loading: () {
                  ProgressIndicator;
                },
              );
        },
        child: newsData.when(
          data: (newsData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    return NewsListTile(
                      articlesData: newsData[index],
                    );
                  },
                ),
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
