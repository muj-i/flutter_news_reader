import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/view/utils/place_holder.dart';
import 'package:flutter_news_reader/view/widgets/custom_cached_network_image.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticlesData articlesData;
  const NewsDetailsScreen({super.key, required this.articlesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articlesData.source?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<bool>(
                future: _checkInternetConnectivity(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || !snapshot.data!) {
                    return Image.asset(
                      PlaceHolderImage().offlinePlaceHolderImage,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return CustomNetworkImage(
                      url:
                          (articlesData.urlToImage?.toString() ?? '').isNotEmpty
                              ? articlesData.urlToImage.toString()
                              : PlaceHolderImage().placeHolderImage,
                    );
                  }
                },
              ),
              Row(
                children: [
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      "Date: ${articlesData.publishedAt ?? ''}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                articlesData.title ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(articlesData.description ?? ''),
              const SizedBox(
                height: 8,
              ),
              Text(articlesData.content ?? ''),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Author: ${articlesData.author ?? ''}",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
