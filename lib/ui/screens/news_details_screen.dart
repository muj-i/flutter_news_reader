import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_article_model.dart';

class NewsDetailsScreen extends StatefulWidget {
  final ArticlesData articlesData;
  const NewsDetailsScreen({super.key, required this.articlesData});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articlesData.source?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 250,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                imageUrl: widget.articlesData.urlToImage.toString(),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Row(
                children: [
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      "Date: ${widget.articlesData.publishedAt ?? ''}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.articlesData.title ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Article Description: ${widget.articlesData.description ?? ''}'),
              const SizedBox(
                height: 8,
              ),
              Text('Article Content: ${widget.articlesData.content ?? ''}'), const SizedBox(
                height: 8,
              ),
               Text(
                 
                 "Author: ${widget.articlesData.author ?? ''}",
                 style: const TextStyle(fontSize: 14,),
                 
               ),
            ],
          ),
        ),
      ),
    );
  }
}
