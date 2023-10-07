import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
              CachedNetworkImage(
                imageUrl: articlesData.urlToImage.toString(),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: .1,
                          backgroundColor: Colors.white54,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                          onPressed: () async {
                            final Uri url = Uri.parse(articlesData.url.toString());
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          }, child: const Text('Read more...',style: TextStyle(
                        color: Colors.black87,
                      ),)
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
