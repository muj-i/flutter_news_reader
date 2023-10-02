import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:flutter_news_reader/view/screens/news_details_screen.dart';
import 'package:flutter_news_reader/view/utils/place_holder.dart';
import 'package:flutter_news_reader/view/widgets/custom_cached_network_image.dart';

class NewsListTile extends StatelessWidget {
  final ArticlesData articlesData;
  const NewsListTile({
    super.key,
    required this.articlesData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(
              articlesData: articlesData,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          subtitle: Column(
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
              const SizedBox(
                width: 8,
              ),
              Text(
                articlesData.title.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                articlesData.description.toString(),
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
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
