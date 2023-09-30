import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/presentation/state_holder/data_provider.dart';
import 'package:flutter_news_reader/presentation/ui/widgets/news_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreakingNewsScreen extends ConsumerWidget {
  BreakingNewsScreen({super.key});

  final _scrollController = ScrollController();

  //final _newsBox = Hive.box('newsBox');

  // @override
  @override
  Widget build(BuildContext context, ref) {
    final newsData = ref.watch(breakingnewsDataProvider);
    return Scaffold(
        body: newsData.when(
            data: (newsData) {
              List<ArticlesData> newsArticleList = newsData.map((e) => e).toList();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        newsArticleList.length,
                    itemBuilder: (context, index) {
                      // if (index < newsArticleList.length) {
                      return NewsListTile(
                articlesData: newsArticleList[index],
              ); 
                    },
                  ),
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()))
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         cachedNews();
        //       },
        //       child: const Text('Write'),
        //     ),
        //     FloatingActionButton(
        //         onPressed: () {
        //           readCachedNews();
        //         },
        //         child: const Text('Read')),
        //     FloatingActionButton(
        //         onPressed: () {
        //           deleteCachedDelete();
        //         },
        //         child: const Text('Delete')),
        //   ],
        // ),
        );
  }

  // void _scrollListener() {
  //   if (_getNewsInProgress) return;
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     log('Call Api, Scroll count listener');

  //     page = page + 30;
  //     getBreakingNews();
  //   } else {
  //     log('Don\'t call Api');
  //   }
  //   //log('Scroll count listener');
  // }

  // void cachedNews() {
  //   _newsBox.put('Data', ['Mate', 'Exam', 26]);
  //   _newsBox.put(2, '888888888888');
  //   _newsBox.put(3, ']]]]]]]]]]]]]]');
  //   _newsBox.put(4, '===================');
  // }

  // void readCachedNews() {
  //   print(_newsBox.get('Data'));

  //   print(_newsBox.get(2));
  //   print(_newsBox.get(3));
  //   print(_newsBox.get(4));
  // }

  // void deleteCachedDelete() {
  //   _newsBox.delete(2);
  // }
}
