import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/presentation/state_holder/breakingnews_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breakingnewsDataProvider = FutureProvider<List<ArticlesData>>((ref) async {
  return ref.watch(breakingnewsProvider).getBreakingNews();
});
